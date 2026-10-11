<!--
Plain-text mirror of the styled HTML/PDF (single-column + standard headings = ATS-parseable).
Location set to "India" (add a city if you want).
Metrics are sourced from Jira/Confluence; where an initiative isn't quantified in the docs it's
stated qualitatively rather than with an invented number. Experience is sorted by impact, AI work first.
-->

# Aviral Gupta

Software Engineer 2 - Developer Productivity & Test Infrastructure

guptaavi352@gmail.com | +91 7726924322 | India | linkedin.com/in/aviral-gupta-754341152

## Summary

Software Engineer 2 on Postman's Test Infrastructure / Developer Productivity team with 3+ years building the platforms, CI/CD, and AI tooling that let hundreds of engineers ship a large Electron desktop application safely and fast. Owner of multiple engineering epics across E2E automation, performance guardrails, test-coverage governance, and AI-driven test triage. I turn slow, flaky, manual quality processes into deterministic, self-serve, metrics-driven systems.

## Recognition

> "You have operated like a one-man army across multiple initiatives, embracing emerging AI technologies and translating them into practical, meaningful offerings for the team - and your work has been central to shifting the narrative around Test Infra, which is no longer viewed as a blocker to feature releases."
> - [Salil Gupta](https://www.linkedin.com/in/salil-gupta-33247a22/), Engineering Manager, Postman

## Experience

### Postman - Software Engineer 2
Test Infrastructure & Developer Productivity | India | Jan 2023 - Present

- **AI-driven test triage & debugging bots.** A developer-experience survey flagged flaky specs as the team's single biggest time-sink, and finding the culprit change meant slow manual New Relic queries. Built an MCP server and daily LLM agents that auto-classify product bugs vs flaky test failures, auto-fix test bugs, and pinpoint culprit PRs from frontend/backend changelogs with AI-generated log summaries - removing most of the manual triage that used to stall PRs and releases.
- **E2E Coverage Signals (AI agent).** There was no data-driven way to see which product areas hurt customers most while having the weakest E2E coverage. Designed and built a dashboard that overlays live customer-pain signals from four sources (GitHub, customer escalations, incident.io, Slack) on a curated feature-to-spec map and ranks the riskiest gaps via an auditable risk formula - a deterministic Node pipeline fed by a daily AI agent, shipped as a React/Vite app on GitHub Pages. Gave leadership the first data-driven view of high-risk, under-tested areas and helped reposition Test Infra from release blocker to enabler.
- **AI-assisted test authoring & Playwright CI platform.** The legacy WebdriverIO suite was slow and flaky and a release bottleneck, with new tests taking days to write. Built the Playwright CI/test platform that powered the team's migration off WDIO - PR and hourly pipelines, flakiness gating, Allure/HTML reports with videos + HAR, automated ticket creation/closing - plus an AI codegen workflow and reusable page objects. Cut full-suite app CI 67% (60 -> 20 min) and new-spec authoring ~98% (~3-4 days -> ~30 min).
- **Selective (change-based) test execution.** Every PR re-ran the entire suite, burning CI minutes on one-line changes. Built coverage-derived selection - an hourly job turns per-spec V8 coverage into a source-to-spec map (auto-refreshed, no hand-maintained list) so a PR runs only the specs that exercise its changed files, auto-scaling CI parallelism and falling back to the full suite only for >100-file or major-dependency changes. Also cut unit-test pipeline cost ~30% with history-based retries and by dropping video/network capture for consistently-green specs.
- **Test-coverage guardrails (patch coverage).** Coverage was informational-only and net coverage moved too slowly to tell authors whether their change was tested - a growing risk as AI generated more code. Shipped incremental (patch) coverage as a blocking PR check for backend services and a postman-app branch-coverage comment scored against CODEOWNERS. Enforced coverage on new code across 37 teams (backend floors 70% critical / 50% non-critical) and onboarded IAM, Workspaces, Collections, PAN and Billing backend services to coverage tracking.
- **App & release performance guardrails.** A slowing app risks UX and churn, and releases had no gate on per-flow wall-clock. Built app launch/relaunch performance measurement (Playwright -> CircleCI -> New Relic) and designed release-level P90/P95 guardrails for 5 core flows across Linux, macOS (Apple Silicon) and Windows (>=30 samples each) that fail a release on a >15% / >250 ms regression, alongside the critical-path bundle-size budget (~30 KB gzipped).
- **Release confidence & faster releases.** Release signoff was manual and slow (~4-5 hrs per build). Built a release-confidence metric that blocks tier rollouts below 95% confidence, plus automated daily-release analysis and summaries that replaced most of the manual signoff - enabling Postman's move to daily / sub-60-minute releases.
- **E2E reliability & flakiness reduction.** Flaky tests eroded trust and blocked merges. Cut flakiness with framework auto-waiting, service virtualization (record/replay) for Postman services, and more actionable Slack alerts and flakiness-trend dashboards.
- **Windows CI IP-allowlisting pipeline.** Windows CI runners come up on dynamic IPs, and a Cloudflare allowlist race condition was intermittently failing Windows E2E runs. Built an AWS Lambda + SQS pipeline that registers each runner's IP against the Cloudflare allowlist and flushes it afterwards - removing the race and stabilizing Windows runs.
- **On-call, incident.io migration & multi-OS / region scale.** Migrated on-call alerting from Opsgenie to incident.io (schedules, routing, a reusable helper package) and authored the on-call runbooks; scaled the E2E platform across Windows/macOS/Linux + Apple Silicon and the EU region.

### AccioJob - Data Structures & Algorithms Mentor
Apr 2022 - Dec 2023

- Mentored students through data-structures and algorithms problem-solving - debugging their approaches, explaining optimal solutions, and sharpening their problem-solving technique.

## Skills

- **Test automation:** Playwright, WebdriverIO, Puppeteer, Allure, Jest, Vitest, React Testing Library, NYC/Istanbul, page-object design, service virtualization
- **CI/CD & build:** CircleCI, GitHub Actions, Nx monorepo, Yarn v4, Docker, SWC, selective/affected test execution, Bash
- **AI & agentic tooling:** MCP servers, LLM agents, RAG, Cursor Automation, Claude, AI-assisted test codegen
- **Observability & data:** New Relic (NRQL), Looker, AWS (Lambda, SQS, Redshift, S3), SonarQube, incident.io, Opsgenie
- **Performance:** launch/relaunch benchmarking, Web Performance API, Lighthouse INP, critical-path bundle-size budgets, P90/P95 regression gating
- **Languages:** TypeScript, JavaScript, Node.js, Python, C++
- **Platforms:** Electron desktop + web, multi-OS (Windows / macOS / Linux, Apple Silicon), LaunchDarkly, Cloudflare, mitmproxy
- **Competitive programming:** LeetCode (max rating 2109), CodeChef (5-star, max rating 2015)

## Education

### Indian Institute of Information Technology, Allahabad - B.Tech, Information Technology
Jul 2019 - Jul 2023 | CGPA 8.53
