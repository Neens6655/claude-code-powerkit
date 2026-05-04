# Claude Code Powerkit

[![Skills](https://img.shields.io/badge/skills-54_installed-4A90D9?style=flat-square)](SKILLS.md)
[![MCP Servers](https://img.shields.io/badge/MCP_servers-10_configured-27AE60?style=flat-square)](MCP-SERVERS.md)
[![Agents](https://img.shields.io/badge/subagents-70_specialists-F5A623?style=flat-square)](SKILLS.md)
[![License](https://img.shields.io/badge/license-MIT-lightgrey?style=flat-square)](LICENSE)
[![Works with](https://img.shields.io/badge/works_with-Claude_Code-7B61FF?style=flat-square)](https://docs.anthropic.com/en/docs/claude-code/overview)
[![Version](https://img.shields.io/badge/version-1.0.0-333?style=flat-square)](CHANGELOG.md)

**One paste. Full setup. Skip the first week.**

The fastest way to go from a blank Claude Code install to a fully equipped development environment — 10 MCP tools, 54 skills, and 70 specialist subagents configured in under 5 minutes, no terminal required.

> **The mechanic:** Paste one URL into Claude Code. Claude reads the installer, fetches every skill and agent from GitHub, writes your config files, and prints a verified summary. Claude installs Claude.

---

## Quick Start

**Step 1 — Install prerequisites** (Node.js is the only hard requirement):

<details>
<summary>macOS</summary>

```bash
# Install Homebrew if you don't have it
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Required
brew install node git

# Recommended (faster installs, GitHub automation)
brew install bun gh

# Optional (needed for specific advanced skills)
brew install python@3.12 ffmpeg
```

</details>

<details>
<summary>Windows (PowerShell as Administrator)</summary>

```powershell
# Required
winget install OpenJS.NodeJS.LTS
winget install Git.Git

# Recommended
winget install Oven-sh.Bun
winget install GitHub.cli

# Optional
winget install Python.Python.3.12
winget install Gyan.FFmpeg
```

> After installing, close and reopen your terminal.

</details>

<details>
<summary>Linux (Ubuntu/Debian)</summary>

```bash
# Node.js v20
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs git

# Recommended
curl -fsSL https://bun.sh/install | bash
sudo apt install gh

# Optional
sudo apt-get install -y python3 ffmpeg
```

</details>

**Verify you're ready:**
```bash
node --version   # v20.x.x or higher
npx --version    # any version number
```

**Step 2 — Open Claude Code and paste this:**

```
Set me up using https://raw.githubusercontent.com/Neens6655/claude-code-powerkit/master/BOOTSTRAP.md
```

Claude does everything else. Takes 3–5 minutes.

**Step 3 — First test (no API key needed):**

```
Take a Playwright screenshot of google.com
```

If that works, you're set up correctly.

---

## What Gets Installed

| | What | Count |
|--|------|-------|
| 🔌 | MCP Servers | 10 |
| ⚡ | Curated Skills | 30 |
| 🌐 | Composio Community Skills | 24 |
| 🤖 | Specialist Subagents | 70 |
| 🎨 | Built-in Design System | 300+ CSS tokens |
| ⚙️ | Settings + Hooks | npm/yarn block, build gate, quality reminder |

---

## 🔌 MCP Servers

MCP servers extend what Claude can do beyond the chat window. Two work immediately with no key. The rest unlock as you add API keys.

| Server | What it unlocks | Key required |
|--------|----------------|-------------|
| **Playwright** | Take screenshots, control browsers, run E2E tests, scrape any page | ✅ No key — works now |
| **Memory** | Remember facts, preferences, and context across sessions permanently | ✅ No key — works now |
| **Brave Search** | Real-time web search — current events, docs, prices, competitors | Brave API — 2,000/mo free |
| **GitHub** | Create PRs, push files, open issues, search code, manage repos | GitHub token — free |
| **Perplexity** | AI-powered research — synthesizes multiple sources into clean answers | Perplexity API |
| **Firecrawl** | Convert any website to clean markdown or structured JSON | Firecrawl — 500 pages/mo free |
| **Apify** | 4,000+ pre-built scrapers: Instagram, LinkedIn, Amazon, TikTok, and more | Apify token — free tier |
| **Google Maps** | Places search, geocoding, directions, distance calculations | Maps API — $200 free credit |
| **OpenRouter** | 100+ AI models from one key: GPT-4o, Gemini 2.5, Llama, Mistral, and more | OpenRouter — free models available |
| **Replicate** | 50,000+ AI models for image, video, audio, 3D generation | Replicate — credits on signup |

---

## ⚡ Skills — Full Catalog

Skills are slash commands that give Claude deep expertise in a specific domain. Type `/skill-name` to activate.

### 🎓 Learn While You Build

| Skill | What it does | Example |
|-------|-------------|---------|
| `/sensei` | Before every code task, names the CS concept at play, asks you to predict the outcome, then teaches and builds. Kill switch: `#noteach` | `Write a debounce function` → Claude names the concept, asks a question, waits for your answer |

### 🏗 Planning & Architecture

| Skill | What it does | Example |
|-------|-------------|---------|
| `/prd` | Interview-driven product requirements doc — Claude asks 8 questions then writes the full spec | `/prd` → describe your idea when prompted |
| `/architect` | System design, file maps, data models, ADRs, risk assessment | `/architect a multi-tenant SaaS with Stripe billing` |
| `/kickoff` | Chains architect → design → build → code review with approval gates at each step | `/kickoff build a user dashboard with analytics` |
| `/app-builder` | Scaffold any app type from a one-sentence description — 13 project templates | `/app-builder a REST API with auth and PostgreSQL` |
| `/autopilot` | Brief → deployed product, zero manual gates. Claude plans, builds, tests, and ships | `/autopilot a landing page for my SaaS` |

### 🧠 AI Advisory Council

| Skill | What it does | Example |
|-------|-------------|---------|
| `/plato` | Spawn 5 expert advisors (Strategist, Architect, Customer, Contrarian, QA) to debate any decision. Get a synthesis verdict with action items | `/plato quick should I build this as a SaaS or a one-time tool?` |
| `/plato quick` | Fast 3-advisor check — findings only, under 2 minutes | `/plato quick review my pricing page` |

### 🎨 Design & Visual

| Skill | What it does | Example |
|-------|-------------|---------|
| `/design` | Built-in design system — 7 style modes, production React + Tailwind output, WCAG compliant. No setup. | `/design a pricing page with 3 tiers` |
| `/design editorial` | Magazine-style editorial layout | `/design editorial a blog post page` |
| `/design glass` | Modern SaaS dark glass aesthetic | `/design glass a dashboard sidebar` |
| `/design brutalist` | Raw, confrontational anti-design | `/design brutalist a portfolio homepage` |
| `/canvas-design` | Algorithmic visual art to PNG/PDF | `/canvas-design a geometric poster with my brand colors` |
| `/data-storytelling` | Transform raw data into compelling narrative + visualization | `/data-storytelling my monthly revenue CSV` |
| `/scroll-experience` | Cinematic scroll storytelling with Lenis + Framer Motion / GSAP | `/scroll-experience a product launch page` |
| `/algorithmic-art` | Generative art with p5.js — particles, geometry, noise fields | `/algorithmic-art a flowing particle system` |
| `/video-forge` | TTS-narrated video pipeline: script → voice clone → Remotion render → localize *(advanced — requires ffmpeg + Remotion + voice API)* | `/video-forge build a 60s product promo` |

### ✅ Code Quality & Debug

| Skill | What it does | Example |
|-------|-------------|---------|
| `/fix` | Trace root cause, explain in plain English, fix scoped to the broken area | `/fix TypeError: Cannot read property 'map' of undefined` |
| `/explain` | Any code, file, or error explained in plain English — layered depth | `/explain what does this regex do` |
| `/vibe-code-auditor` | Catch fragile AI-generated code before it ships — finds hardcoded values, missing error handling, hidden assumptions | `/vibe-code-auditor` on any file |
| `/iterate` | Audit-first improvement for shipped products — finds issues before fixing | `/iterate my checkout flow is slow` |
| `/feedback-loop` | Capture a correction → extract a rule → save it so future sessions don't repeat the mistake | `/feedback-loop never use inline styles` |

### ✍️ Writing & Content

| Skill | What it does | Example |
|-------|-------------|---------|
| `/beautiful-prose` | Hard-edged writing style contract — kills generic AI voice, enforces specific, concrete language | `/beautiful-prose write a product announcement` |
| `/marketing-psychology` | Behavioral science copy — mental models, social proof, loss aversion, conversion optimization | `/marketing-psychology write a landing page hero` |
| `/baoyu-infographic` | Research-backed infographics in 18 visual styles | `/baoyu-infographic the history of AI` |
| `/baoyu-image-gen` | AI image generation across Replicate, Stable Diffusion, DALL-E | `/baoyu-image-gen a Bauhaus-style product shot` |

### 💻 Code Expertise

| Skill | What it does | Example |
|-------|-------------|---------|
| `/react-best-practices` | 40+ Vercel-level performance rules — Server Components, bundle splitting, suspense boundaries | Use before building any React component |
| `/tailwind-patterns` | Tailwind v4 CSS-first patterns — `@theme {}` in CSS, not config files | Use for any Tailwind v4 project |
| `/typescript-expert` | Deep TypeScript — narrowing, generics, strict patterns, discriminated unions | `/typescript-expert make this type-safe` |

### 🚀 Advanced & Automation

| Skill | What it does | Example |
|-------|-------------|---------|
| `/loki-mode` | Autonomous multi-agent startup system — spins up coordinated agents to build in parallel | `/loki-mode build a SaaS MVP in one session` |
| `/dispatching-parallel-agents` | Run 2+ independent tasks simultaneously — cuts build time in half | `Run in parallel: build the header AND the API` |
| `/mcp-builder` | Build a custom MCP server from scratch — write tools Claude can call | `/mcp-builder a server that reads my Notion database` |
| `/micro-saas-launcher` | End-to-end SaaS launch framework — from idea to live product | `/micro-saas-launcher my idea is X` |
| `/cheap-route` | Route non-critical tasks (docs, summaries, formatting) to cheaper models via OpenRouter to save quota | `/cheap-route explain this function` |

---

## 🌐 Composio Community Skills (24 additional skills)

Installed automatically from [ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills):

| Skill | What it does |
|-------|-------------|
| `/artifacts-builder` | Multi-component HTML/React artifact creation |
| `/brand-guidelines` | Apply brand standards to any content |
| `/changelog-generator` | Auto-generate release notes from git commits |
| `/competitive-ads-extractor` | Analyze competitor advertising strategies |
| `/content-research-writer` | Research-backed writing with citations |
| `/developer-growth-analysis` | Dev productivity and growth insights |
| `/document-skills` | Document processing workflows |
| `/domain-name-brainstormer` | Generate and validate domain name ideas |
| `/file-organizer` | Intelligent file organization |
| `/image-enhancer` | Image quality improvement workflows |
| `/internal-comms` | Company communication templates |
| `/invoice-organizer` | Tax-ready invoice management |
| `/lead-research-assistant` | Lead qualification and outreach |
| `/meeting-insights-analyzer` | Meeting pattern and insights analysis |
| `/raffle-winner-picker` | Cryptographically secure winner selection |
| `/skill-creator` | Build new Claude skills from scratch |
| `/skill-share` | Package and share your custom skills |
| `/slack-gif-creator` | Slack-optimized GIF generation |
| `/tailored-resume-generator` | Job-matched resume creation |
| `/theme-factory` | Font and color theme presets |
| `/twitter-algorithm-optimizer` | Tweet optimization for engagement |
| `/video-downloader` | YouTube and platform video downloads |
| `/webapp-testing` | Playwright-based web app testing |
| `/template-skill` | Skill scaffolding template |

---

## 🤖 Specialist Subagents (70 total)

Subagents are experts Claude spawns automatically when a task needs deep domain knowledge. You don't invoke them directly — Claude routes to the right one based on what you're building.

**How it works:** Ask Claude to "build me a FastAPI endpoint with auth" and it automatically delegates to the `fastapi-expert` and `security-auditor` agents in parallel. You get specialist-level output without knowing the agent names.

<details>
<summary><strong>Business & Product (18 agents — from VoltAgent)</strong></summary>

| Agent | What it does |
|-------|-------------|
| `product-manager` | Product strategy, roadmap, prioritization frameworks |
| `content-marketer` | Content strategy, SEO, distribution playbooks |
| `ux-researcher` | User research, interview scripts, usability analysis |
| `business-analyst` | Requirements gathering, process mapping, gap analysis |
| `project-manager` | Agile planning, sprint design, delivery tracking |
| `wordpress-master` | WordPress development, plugins, performance optimization |
| `research-analyst` | Comprehensive research across any domain |
| `project-idea-validator` | Brutal go/no-go product validation — kills bad ideas fast |
| `competitive-analyst` | Competitive intelligence, positioning analysis |
| `market-researcher` | Market sizing, consumer insights, trend analysis |
| `frontend-developer` | React, Vue, Angular UI specialist |
| `fullstack-developer` | End-to-end feature development |
| `ui-designer` | Visual design and interaction patterns |
| `debugger` | Advanced debugging and root cause analysis |
| `code-reviewer` | Code quality, patterns, anti-patterns |
| `qa-expert` | Test strategy, test automation, coverage analysis |
| `ai-writing-auditor` | Detect and rewrite AI-sounding patterns |
| `technical-writer` | Technical documentation, guides, API docs |

</details>

<details>
<summary><strong>Core Development (4 agents)</strong></summary>

| Agent | What it does |
|-------|-------------|
| `architect` | System design, architecture decisions, ADRs |
| `code-reviewer` | Deep code quality review, security, maintainability |
| `debugger` | Root cause debugging specialist |
| `refactorer` | Code cleanup, restructuring, modernization |

</details>

<details>
<summary><strong>Framework Specialists (8 agents)</strong></summary>

| Agent | Framework | Specialty |
|-------|-----------|-----------|
| `nextjs-expert` | Next.js 15 | App Router, Server Components, streaming |
| `react-expert` | React 19 | Hooks, performance, concurrent features |
| `fastapi-expert` | FastAPI | Async Python APIs, Pydantic, OpenAPI |
| `django-expert` | Django | ORM, REST framework, admin |
| `vue-expert` | Vue 3 | Composition API, Pinia, Nuxt |
| `svelte-expert` | SvelteKit | Svelte 5, file routing, SSR |
| `astro-expert` | Astro | Islands architecture, content collections |
| `nestjs-expert` | NestJS | TypeScript backend, decorators, DI |

</details>

<details>
<summary><strong>Language Specialists (5 agents)</strong></summary>

| Agent | Language | Focus |
|-------|----------|-------|
| `python-expert` | Python 3.12+ | Modern patterns, type hints, async |
| `typescript-expert` | TypeScript | Strict mode, advanced types, generics |
| `javascript-expert` | JavaScript | ES2024, patterns, performance |
| `go-expert` | Go | Concurrency, idiomatic patterns, interfaces |
| `rust-expert` | Rust | Ownership, lifetimes, systems programming |

</details>

<details>
<summary><strong>Database (4 agents)</strong></summary>

| Agent | What it does |
|-------|-------------|
| `postgresql-expert` | Query optimization, indexes, migrations, partitioning |
| `mongodb-expert` | Aggregations, schema design, Atlas |
| `redis-expert` | Caching strategies, pub/sub, data structures |
| `database-architect` | Database design, normalization, scaling patterns |

</details>

<details>
<summary><strong>Infrastructure & DevOps (5 agents)</strong></summary>

| Agent | What it does |
|-------|-------------|
| `aws-expert` | AWS services, IAM, CDK, deployment patterns |
| `cicd-expert` | GitHub Actions, pipelines, deployment automation |
| `devops-engineer` | Docker, containers, observability |
| `kubernetes-expert` | Kubernetes, Helm, service mesh, autoscaling |
| `terraform-expert` | Terraform, IaC, cloud provisioning |

</details>

<details>
<summary><strong>Quality & Security (7 agents)</strong></summary>

| Agent | What it does |
|-------|-------------|
| `playwright-expert` | Playwright E2E testing, page objects, CI integration |
| `security-auditor` | OWASP Top 10, code security review, threat modeling |
| `accessibility-expert` | WCAG 2.1, screen readers, a11y testing |
| `e2e-testing-expert` | End-to-end test strategy and implementation |
| `performance-engineer` | Core Web Vitals, bundle analysis, rendering perf |
| `devsecops-engineer` | Security in CI/CD, SAST, dependency scanning |
| `security-pentester` | Penetration testing, vulnerability assessment |

</details>

<details>
<summary><strong>Mobile (2 agents)</strong></summary>

| Agent | What it does |
|-------|-------------|
| `react-native-expert` | React Native, Expo, navigation, native modules |
| `flutter-expert` | Flutter, Dart, cross-platform, state management |

</details>

<details>
<summary><strong>Data, AI & Analytics (4 agents)</strong></summary>

| Agent | What it does |
|-------|-------------|
| `ai-engineer` | LLM integration, prompt engineering, RAG, agents |
| `data-engineer` | Data pipelines, ETL, warehouses, Spark |
| `ml-engineer` | ML models, training pipelines, deployment |
| `bi-expert` | Business intelligence, dashboards, SQL analytics |

</details>

<details>
<summary><strong>Documentation & Orchestration (6 agents)</strong></summary>

| Agent | What it does |
|-------|-------------|
| `technical-writer-dev` | Technical documentation for developers |
| `api-documenter` | OpenAPI, API reference docs |
| `code-documenter` | JSDoc, docstrings, inline documentation |
| `prd-writer` | Product requirements documents |
| `tech-lead` | Technical leadership, architecture decisions |
| `project-manager` | Project planning, Agile, delivery |

</details>

<details>
<summary><strong>Specialized (7 agents)</strong></summary>

| Agent | What it does |
|-------|-------------|
| `ui-components-expert` | Component library design, Storybook, design systems |
| `ux-designer` | UX flows, user journeys, wireframe direction |
| `seo-expert` | SEO implementation, structured data, Core Web Vitals |
| `payment-expert` | Stripe, payment flows, PCI compliance |
| `graphql-expert` | GraphQL schema, resolvers, Apollo, Federation |
| `websocket-expert` | WebSockets, real-time systems, Socket.io |
| `ai-writing-auditor` | Detect and eliminate AI-sounding writing patterns |

</details>

---

## 🎨 Built-in Design System

The kit ships with a production-grade design system — activated with `/design`. No configuration needed.

**7 visual styles:**

| Style | Aesthetic | Best for |
|-------|-----------|---------|
| `bauhaus` *(default)* | Geometric, 0 border-radius, IBM Plex Mono, beige/charcoal | Dashboards, tools, institutional |
| `editorial` | Magazine, serif body, blue accents | Blogs, content, portfolios |
| `brutalist` | Raw, black/white, heavy borders | Portfolios, art, attention-grabbing |
| `agency` | Premium consultancy, cream/navy/gold | Landing pages, B2B |
| `glass` | Dark, backdrop-blur, translucent cards | SaaS dashboards |
| `dark` | Near-black, developer terminal aesthetic | Dev tools, CLIs |
| `custom` | Describe your own palette and Claude generates tokens | Any brand |

**What `/design` produces for each request:**
- Ready-to-paste React + Tailwind v4 component code
- Full CSS token set for the chosen style
- Precise spacing, typography scale, and color usage guide
- WCAG AA compliant by default

```
/design a pricing page with 3 tiers
/design editorial a blog post layout
/design glass a user settings panel
/design --tokens   ← outputs the full CSS custom property set
```

---

## 🔑 API Keys

### Works immediately (no key needed)
- **Playwright** — screenshots, browser automation
- **Memory** — remembers facts across sessions

### Get these first (5 min each, free)

| Service | Get key | Free tier |
|---------|---------|-----------|
| Brave Search | [api.search.brave.com](https://api.search.brave.com) | 2,000 searches/mo |
| GitHub | [github.com/settings/tokens](https://github.com/settings/tokens) | Unlimited |

### Add when you need them

| Service | Get key | What it unlocks |
|---------|---------|----------------|
| OpenRouter | [openrouter.ai/keys](https://openrouter.ai/keys) | GPT-4o, Gemini 2.5, Llama, 100+ models |
| Firecrawl | [firecrawl.dev](https://firecrawl.dev) | Web scraping, 500 pages/mo free |
| Perplexity | [perplexity.ai/settings/api](https://www.perplexity.ai/settings/api) | AI research synthesis |
| Replicate | [replicate.com/account/api-tokens](https://replicate.com/account/api-tokens) | Image/video/audio generation |
| Apify | [apify.com](https://apify.com) | 4,000+ specialized scrapers |
| Google Maps | [console.cloud.google.com](https://console.cloud.google.com) | Places, geocoding ($200 free credit) |

**Where to add them:**  
Find the Claude Desktop config file and replace each `YOUR_*_KEY` placeholder:
- macOS: `~/Library/Application Support/Claude/claude_desktop_config.json`
- Windows: `%APPDATA%\Claude\claude_desktop_config.json`

---

## 🚀 Start Here — First Steps

After install, try these in order:

**No key needed:**
```
Take a Playwright screenshot of google.com
```
→ Proves your setup works. Should complete in seconds.

**Plan your first project** `[BEGINNER]`
```
/prd
```
→ Claude asks 8 questions and writes a complete requirements doc.

**See the design system** `[BEGINNER]`
```
/design a landing page with a hero, features, and CTA
```
→ Get production-ready React + Tailwind code, immediately.

**Get expert feedback on an idea** `[BEGINNER]`
```
/plato quick [describe your idea in one sentence]
```
→ 3 expert advisors stress-test your idea in under 2 minutes.

**Build end-to-end** `[INTERMEDIATE]`
```
/kickoff build a dashboard that shows my GitHub repo stats
```
→ Claude architects, designs, builds, and reviews. You approve at each gate.

**Learn while building** `[BEGINNER]`
```
/sensei
```
→ Before every code task, Claude names the concept, asks you to predict the outcome, then teaches and builds.

**Advanced:**
```
/loki-mode    — autonomous multi-agent build (no gates)
/autopilot    — describe it once, Claude ships it
/video-forge  — TTS-narrated video (needs ffmpeg + Remotion + voice API)
```

---

## ⚙️ What the Settings Do

The kit writes `~/.claude/settings.json` with three active hooks:

| Hook | When it fires | What it does |
|------|--------------|-------------|
| PreToolUse | Before any `npm install` or `yarn add` | Blocks it and says "use bun" |
| PostToolUse | After editing any `.ts`, `.tsx`, `.css` file | Reminds you to verify the build |
| Stop | When Claude finishes a session | Asks if you took screenshots and ran tests |

Plus permissions pre-approved for common operations (git, bun, npx, curl, gh) so you don't get prompted for every command.

---

## 📁 Repo Structure

```
claude-code-powerkit/
├── BOOTSTRAP.md          ← The installer — paste URL into Claude Code
├── README.md
├── setup.sh              ← Partial terminal alternative (skills only, no agents)
├── TIPS.md               ← 12 production lessons from real usage
├── SKILLS.md             ← Full skills catalog with sources
├── MCP-SERVERS.md        ← Detailed MCP setup guide + key links
├── REPOS.md              ← 40+ repos for skills, agents, MCP servers
│
├── configs/
│   ├── settings.json     ← Claude Code settings (hooks + permissions + plugins)
│   ├── mcp.json          ← 10 MCP server template (fill in API keys)
│   ├── CLAUDE.md         ← Project instructions template
│   └── rules/
│       ├── frontend.md   ← React + Tailwind coding rules
│       └── api.md        ← API coding rules
│
├── skills/               ← 30 curated skill files
│   ├── sensei.md
│   ├── design.md
│   ├── plato.md
│   ├── video-forge.md
│   └── ... (27 more)
│
├── agents/               ← 52 developer specialist subagents
│   ├── nextjs-expert.md
│   ├── security-auditor.md
│   └── ... (50 more)
│
└── design-system/
    ├── tokens.css        ← 300+ CSS custom properties
    └── quick-start.md    ← 5-minute integration guide
```

---

## 🔧 Manual Install (Terminal)

> ⚠️ This installs skills, settings, and CLAUDE.md only — it does **not** install the 70 subagents or 24 Composio skills. For the full install, use the BOOTSTRAP.md URL method above.

```bash
git clone https://github.com/Neens6655/claude-code-powerkit.git
cd claude-code-powerkit
bash setup.sh
```

Then copy `configs/mcp.json` to your Claude Desktop config location and fill in API keys.

---

## 🔗 More Resources

- [TIPS.md](TIPS.md) — 12 production lessons from real usage
- [MCP-SERVERS.md](MCP-SERVERS.md) — Detailed setup guide for all 10 servers
- [SKILLS.md](SKILLS.md) — Full skills catalog with install sources
- [REPOS.md](REPOS.md) — 40+ repos for more skills, agents, and MCP servers
- [Anthropic Claude Code docs](https://docs.anthropic.com/en/docs/claude-code/overview)

---

## 📄 License

MIT. Fork it, modify it, share it.

---

*Last verified: 2026-05-04 · Claude Code v1.x · v1.0.0*
