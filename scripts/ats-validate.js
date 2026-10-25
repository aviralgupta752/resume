#!/usr/bin/env node

/**
 * ats-validate.js
 * Validates ATS readability, page count, and key section presence in generated PDFs.
 */

const { spawnSync } = require('child_process');
const path = require('path');
const fs = require('fs');

const pdfFile = process.argv[2] || 'aviral-gupta-resume.pdf';
const fullPath = path.resolve(process.cwd(), pdfFile);

if (!fs.existsSync(fullPath)) {
  console.error(`Error: File not found: ${fullPath}`);
  process.exit(1);
}

// AppleScript source passed directly
const scriptSource = [
  'use framework "Foundation"',
  'use framework "PDFKit"',
  '',
  `set pdfURL to current application's NSURL's fileURLWithPath:"${fullPath}"`,
  `set pdfDoc to current application's PDFDocument's alloc()'s initWithURL:pdfURL`,
  `if pdfDoc is missing value then`,
  `    error "Could not load PDF document"`,
  `end if`,
  `set pCount to pdfDoc's pageCount()`,
  `set fullText to (pdfDoc's |string|()) as text`,
  `return (pCount as text) & "|||ATS_DELIM|||" & fullText`
].join('\n');

try {
  const child = spawnSync('osascript', ['-l', 'AppleScript'], {
    input: scriptSource,
    encoding: 'utf-8',
    maxBuffer: 10 * 1024 * 1024
  });

  if (child.status !== 0) {
    throw new Error(child.stderr || 'osascript execution failed');
  }

  const result = child.stdout;
  const [pageCountStr, ...textParts] = result.split('|||ATS_DELIM|||');
  const pageCount = parseInt(pageCountStr.trim(), 10);
  const text = textParts.join('|||ATS_DELIM|||').trim();

  console.log(`=== ATS Validation Report: ${pdfFile} ===`);
  console.log(`Page count: ${pageCount} (Expected: 1)`);
  console.log(`Extracted character length: ${text.length}`);

  let passed = true;

  if (pageCount !== 1) {
    console.error(`❌ FAILED: Page count is ${pageCount}, expected exactly 1 page.`);
    passed = false;
  } else {
    console.log(`✅ Page count: Exactly 1 page.`);
  }

  // Required Sections
  const requiredSections = [
    'Summary',
    'Experience',
    'Skills',
    'Education'
  ];

  for (const sec of requiredSections) {
    const regex = new RegExp(`\\b${sec}\\b`, 'i');
    if (regex.test(text)) {
      console.log(`✅ Section detected: ${sec}`);
    } else {
      console.error(`❌ FAILED: Section missing: ${sec}`);
      passed = false;
    }
  }

  // Essential Contact & Content checks
  const requiredKeywords = [
    { label: 'Name', test: /Aviral\s+Gupta/i },
    { label: 'Email', test: /guptaavi352@gmail\.com/i },
    { label: 'Phone', test: /\+?91[\s-]?7726924322/i },
    { label: 'Current Company (Postman)', test: /Postman/i },
    { label: 'College (IIIT Allahabad)', test: /Allahabad/i },
    { label: 'Core Skills (Playwright, TypeScript, MCP)', test: /(?=.*Playwright)(?=.*TypeScript)(?=.*MCP)/is }
  ];

  for (const { label, test } of requiredKeywords) {
    if (test.test(text)) {
      console.log(`✅ Key content found: ${label}`);
    } else {
      console.error(`❌ FAILED: Key content missing: ${label}`);
      passed = false;
    }
  }

  if (passed) {
    console.log('\n🎉 ALL ATS VALIDATION CHECKS PASSED: 100% parseable, 1 page.');
    process.exit(0);
  } else {
    console.error('\n⚠️ ATS VALIDATION FAILED. Please review the errors above.');
    process.exit(1);
  }
} catch (err) {
  console.error('Error running PDFKit ATS validation:', err.message);
  process.exit(1);
}
