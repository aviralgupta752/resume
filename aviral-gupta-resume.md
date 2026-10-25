<!--
Plain-text mirror of the styled HTML/PDF (single-column + standard headings = ATS-parseable).
Location set to "India" (add a city if you want).
Metrics are sourced from Jira/Confluence; where an initiative isn't quantified in the docs it's
stated qualitatively rather than with an invented number. Experience is sorted by impact, AI work first.
-->

# Aviral Gupta

Software Engineer 2 - Developer Productivity & Platform Infrastructure

guptaavi352@gmail.com | +91 7726924322 | India | linkedin.com/in/aviral-gupta-754341152

## Summary

Software Engineer 2 on Postman's Developer Productivity & Platform Infrastructure team. Over 3+ years, built the core CI/CD platforms, performance regression gates, and AI-driven developer tooling supporting 200+ engineers across 20 squads shipping ~45 PRs daily across Postman's web and Electron desktop apps. Specializes in transforming slow, non-deterministic build and test workflows into high-throughput, self-serve developer platforms.

## Recognition

> "Operated like a one-man army across multiple initiatives, embracing AI technologies into practical offerings... central to shifting Test Infra from a blocker to an enabler of feature releases."
> - [Salil Gupta](https://www.linkedin.com/in/salil-gupta-33247a22/), Engineering Manager, Postman ([View quarterly reviews](https://aviralgupta752.github.io/Aviral-Resume/))

## Experience

### Postman - Software Engineer 2
Developer Productivity & Platform Infrastructure | India | Jan 2023 - Present

- **Core CI/CD & Test Platform Migration:** Migrated legacy WebdriverIO suite to Playwright, eliminating CJS transpilation layers and enabling native ES with Chrome DevTools Protocol (CDP) execution (~2x faster than ChromeDriver hops); packaged core capabilities into a modular automations library and integrated agent-scaffolded spec generation to cut new-spec authoring by ~80% (~1 story point -> ~30-60 min).
- **Change-Based Selective Test Execution:** Architected selective test execution across 45+ daily PRs: dynamically mapped changed code to affected suites by extracting V8 coverage chunk hashes and resolving source-maps to executed lines, eliminating full-suite overhead on incremental PRs and catching ~90% of regressions pre-merge.
- **AI-Driven Triage & MCP Server:** Shipped test-infra-mcp-server and LLM agents to provide on-demand test triggering, squad-level flakiness tracking, and automated root-cause triage of consistent test failures using New Relic telemetry; processes 70-140 failure tickets weekly and autonomously resolves ~70% without human intervention.
- **E2E Coverage Signals (AI Risk Platform):** Designed E2E Coverage Signals, an automated risk-assessment platform mapping customer-pain signals (GitHub, escalations, incident.io, Slack) against E2E test coverage using an auditable scoring model; built with a daily AI agent ingestion pipeline and React/Vite dashboard, delivering leadership's first visibility into high-risk coverage gaps.
- **Incremental Test-Coverage Guardrails:** Designed and rolled out incremental (patch) coverage gating via reusable GitHub Actions across ~100 backend repositories (IAM, Workspaces, Billing, Collections), increasing company-wide unit and integration test coverage from 42% to 73% in 3 months.
- **Release Confidence & Automated Signoff:** Created a release-confidence score that holds back a tier rollout until it clears 95%. Automated daily-release analysis and summaries took over most of the ~4-5 hr manual signoff, a big part of how Postman now ships daily, in under an hour.
- **App Warm-Boot Performance Gates:** Measured app warm-boot times through a Playwright -> CircleCI -> New Relic pipeline and turned them into release gates. Built the self-serve infra behind it so developers can trigger runs on demand across every OS, see how their PR affects performance, and compare it against earlier builds.
- **Windows CI Cloudflare IP Synchronization:** Eliminated flaky Windows CI runner failures caused by Cloudflare allowlist race conditions by engineering an event-driven AWS Lambda + SQS pipeline to dynamically synchronize and flush ephemeral runner IPs.
- **Operations & Infrastructure Reliability:** Migrated mission-critical on-call alerting and paging from Opsgenie to incident.io (schedules, routing, shared automation helpers); reduced E2E test setup latency by 80% (30s -> 6s) via parallel user provisioning, asynchronous lifecycle cleanup, barrel-file tree-shaking, and network response caching.

### AccioJob - Data Structures & Algorithms Mentor
Apr 2022 - Dec 2023

- Mentored students through data-structures and algorithms problem-solving - debugging approaches, explaining optimal solutions, and sharpening problem-solving technique.

## Skills

- **Languages:** TypeScript, JavaScript, Node.js, Python, C++, Bash
- **AI & Agentic Systems:** Model Context Protocol (MCP), LLM Agents, Multi-agent Triage, RAG, Cursor/Claude Automation APIs
- **CI/CD & Build:** CircleCI, GitHub Actions, Nx monorepo, Yarn Berry, Selective/Change-based Execution, Docker
- **Test Platforms:** Playwright, WebdriverIO, Puppeteer, Allure, NYC/Istanbul, V8 Coverage AST mapping, Service Virtualization
- **Observability & Cloud:** New Relic (NRQL), AWS (Lambda, SQS, S3, Redshift), Looker, incident.io, Opsgenie, SonarQube
- **Performance & Reliability:** Warm-boot & relaunch benchmarking, P90/P95 regression gating, critical-path bundle-size gates, Lighthouse
- **Competitive Programming:** LeetCode (max rating 2109), CodeChef (5-star, max rating 2015)

## Education

### Indian Institute of Information Technology, Allahabad - B.Tech, Information Technology
Jul 2019 - Jul 2023 | CGPA 8.53
