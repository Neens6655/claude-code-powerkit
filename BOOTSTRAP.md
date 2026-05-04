# Claude Code Powerkit — Auto-Installer

> **FOR CLAUDE:** A user has pointed you at this file to set up their Claude Code environment.
> Execute every step. Write every file. When complete, print the ✅ summary.
> The user may be non-technical — do the work, don't ask them to do it manually.

---

## What's being installed

- **10 MCP servers** — browser, search, GitHub, research, scraping, AI models, maps, memory
- **30 curated skills** — /design, /plato, /sensei, /autopilot, /prd, /fix, /video-forge, and more
- **26 Composio community skills** — writing, research, productivity, business tools
- **70 subagents** — 18 VoltAgent (business/product) + 52 developer specialists (framework, language, database, infra)
- **ZGNAL Design System** — production design tokens and component patterns
- **Optimized settings** — hooks, permissions, quality gates

Estimated time: 3–5 minutes.

---

## STEP 1 — DETECT PLATFORM

```bash
uname -s 2>/dev/null || echo "Windows"
```

Config file locations:
- **macOS** Claude Desktop → `~/Library/Application Support/Claude/claude_desktop_config.json`
- **Windows** Claude Desktop → `%APPDATA%\Claude\claude_desktop_config.json`
- **Claude Code settings** (all platforms) → `~/.claude/settings.json`

---

## STEP 2 — WRITE CLAUDE CODE SETTINGS

Write to `~/.claude/settings.json` (merge if file already exists — don't overwrite existing keys):

```json
{
  "$schema": "https://json.schemastore.org/claude-code-settings.json",
  "cleanupPeriodDays": 365,
  "env": {
    "BASH_MAX_OUTPUT_LENGTH": "150000"
  },
  "permissions": {
    "allow": [
      "Bash(grep:*)",
      "Bash(bun:*)",
      "Bash(npm:*)",
      "Bash(git:*)",
      "Bash(node:*)",
      "Bash(npx:*)",
      "Bash(curl:*)",
      "Bash(ls:*)",
      "Bash(mkdir:*)",
      "Bash(cp:*)",
      "Bash(mv:*)",
      "Bash(gh:*)",
      "WebSearch"
    ]
  },
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "command": "if echo \"$ARGUMENTS\" | grep -qiE '\"command\"\\s*:\\s*\"(npm (install|add)|yarn (install|add))'; then echo 'BLOCKED: Use bun instead of npm/yarn. Run: bun install or bun add <package>' >&2; exit 2; fi",
            "statusMessage": "Checking package manager..."
          }
        ]
      }
    ],
    "PostToolUse": [
      {
        "matcher": "Write|Edit",
        "hooks": [
          {
            "type": "command",
            "command": "if echo \"$TOOL_INPUT\" | grep -qiE '\\.tsx|\\.ts|\\.jsx|\\.css'; then echo 'BUILD_CHECK: Frontend file modified. Verify build before shipping.'; fi",
            "statusMessage": "Checking if build verification needed..."
          }
        ]
      }
    ],
    "Stop": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "echo 'QUALITY_GATE: Did you run tests? Did Playwright screenshot? Is the build passing?'"
          }
        ]
      }
    ]
  },
  "enabledPlugins": {
    "claude-code-setup@claude-plugins-official": true,
    "frontend-design@claude-plugins-official": true,
    "playwright@claude-plugins-official": true,
    "agent-sdk-dev@claude-plugins-official": true,
    "claude-md-management@claude-plugins-official": true,
    "code-simplifier@claude-plugins-official": true
  }
}
```

---

## STEP 3 — WRITE MCP CONFIGURATION

Detect platform and write to the correct Claude Desktop config file.
> If file already exists, merge `mcpServers` keys — do NOT overwrite existing servers.

```json
{
  "mcpServers": {
    "playwright": {
      "command": "npx",
      "args": ["@playwright/mcp@latest", "--browser", "chromium"]
    },
    "memory": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-memory"]
    },
    "brave-search": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-brave-search"],
      "env": { "BRAVE_API_KEY": "YOUR_BRAVE_API_KEY" }
    },
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": { "GITHUB_PERSONAL_ACCESS_TOKEN": "YOUR_GITHUB_TOKEN" }
    },
    "perplexity": {
      "command": "npx",
      "args": ["-y", "perplexity-mcp"],
      "env": { "PERPLEXITY_API_KEY": "YOUR_PERPLEXITY_KEY" }
    },
    "firecrawl": {
      "command": "npx",
      "args": ["-y", "firecrawl-mcp"],
      "env": { "FIRECRAWL_API_KEY": "YOUR_FIRECRAWL_KEY" }
    },
    "apify": {
      "command": "npx",
      "args": ["-y", "@apify/actors-mcp-server"],
      "env": { "APIFY_TOKEN": "YOUR_APIFY_TOKEN" }
    },
    "google-maps": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-google-maps"],
      "env": { "GOOGLE_MAPS_API_KEY": "YOUR_GOOGLE_MAPS_KEY" }
    },
    "openrouter": {
      "command": "npx",
      "args": ["-y", "mcp-openai"],
      "env": {
        "OPENAI_API_KEY": "YOUR_OPENROUTER_KEY",
        "OPENAI_BASE_URL": "https://openrouter.ai/api/v1"
      }
    },
    "replicate": {
      "command": "npx",
      "args": ["-y", "replicate-mcp"],
      "env": { "REPLICATE_API_TOKEN": "YOUR_REPLICATE_TOKEN" }
    },
    "replicate": {
      "command": "npx",
      "args": ["-y", "replicate-mcp"],
      "env": { "REPLICATE_API_TOKEN": "YOUR_REPLICATE_TOKEN" }
    }
  }
}
```

---

## STEP 4 — INSTALL CURATED SKILLS

Create `~/.claude/skills/` if it doesn't exist.

For each skill, fetch from:
`https://raw.githubusercontent.com/Neens6655/claude-code-powerkit/master/skills/[filename]`

Write each to: `~/.claude/skills/[skill-name]/SKILL.md`

| Skill name | Fetch file | What it does |
|------------|-----------|--------------|
| sensei | sensei.md | Inline learning — teaches CS concepts before every code task |
| design | design.md | ZGNAL Design System — production UI patterns + tokens |
| plato | plato.md | AI Advisory Council — 5 advisors debate any decision |
| autopilot | autopilot.md | Brief-to-deployed product pipeline, zero manual gates |
| prd | prd.md | Write product requirements documents |
| architect | architect.md | System architecture planning |
| kickoff | kickoff.md | Orchestrate a full feature build end-to-end |
| app-builder | app-builder.md | Scaffold full applications from a description |
| iterate | iterate.md | Audit + improve any shipped product |
| fix | fix.md | Trace root cause and fix bugs |
| explain | explain.md | Explain any code or concept in plain English |
| vibe-code-auditor | vibe-code-auditor.md | Catch fragile AI-generated code patterns |
| feedback-loop | feedback-loop.md | Capture corrections as permanent rules |
| dispatching-parallel-agents | dispatching-parallel-agents.md | Run independent tasks simultaneously |
| micro-saas-launcher | micro-saas-launcher.md | SaaS product launch framework |
| marketing-psychology | marketing-psychology.md | Behavioral science copy |
| react-best-practices | react-best-practices.md | React + Next.js optimization |
| tailwind-patterns | tailwind-patterns.md | Tailwind v4 patterns |
| typescript-expert | typescript-expert.md | TypeScript deep expertise |
| baoyu-image-gen | baoyu-image-gen.md | AI image generation (multi-provider) |
| baoyu-infographic | baoyu-infographic.md | Research-backed infographic builder |
| canvas-design | canvas-design.md | Visual art to PNG/PDF |
| data-storytelling | data-storytelling.md | Data narrative and visualization |
| loki-mode | loki-mode.md | Autonomous multi-agent startup system |
| mcp-builder | mcp-builder.md | Build custom MCP servers |
| cheap-route | cheap-route.md | Route non-critical tasks to cheaper models |
| beautiful-prose | beautiful-prose.md | Publication-quality writing and editing |
| video-forge | video-forge.md | TTS-narrated video: script → voice clone → Remotion → deliver |
| algorithmic-art | algorithmic-art.md | Generative art with p5.js — particles, noise fields, geometry |
| scroll-experience | scroll-experience.md | Cinematic scroll storytelling with Lenis + Framer Motion |

---

## STEP 5 — INSTALL COMPOSIO COMMUNITY SKILLS

For each skill below, fetch from:
`https://raw.githubusercontent.com/ComposioHQ/awesome-claude-skills/main/[skill-name]/SKILL.md`

Write each to: `~/.claude/skills/[skill-name]/SKILL.md`

| Skill name | What it does |
|------------|-------------|
| artifacts-builder | Multi-component HTML/React artifact creation |
| brand-guidelines | Apply brand standards to any content |
| changelog-generator | Auto-generate release notes from git commits |
| competitive-ads-extractor | Analyze competitor advertising |
| content-research-writer | Research-backed writing with citations |
| developer-growth-analysis | Dev productivity and growth insights |
| document-skills | Document processing workflows |
| domain-name-brainstormer | Generate and validate domain names |
| file-organizer | Intelligent file organization |
| image-enhancer | Image quality improvement |
| internal-comms | Company communication templates |
| invoice-organizer | Tax-ready invoice management |
| lead-research-assistant | Lead qualification and outreach |
| meeting-insights-analyzer | Meeting pattern and insights analysis |
| raffle-winner-picker | Cryptographically secure winner selection |
| skill-creator | Build new Claude skills from scratch |
| skill-share | Package and share your skills |
| slack-gif-creator | Slack-optimized GIF generation |
| tailored-resume-generator | Job-matched resume creation |
| theme-factory | Font and color theme presets |
| twitter-algorithm-optimizer | Tweet optimization for engagement |
| video-downloader | YouTube and platform video downloads |
| webapp-testing | Playwright-based web app testing |
| template-skill | Skill scaffolding template |

---

## STEP 6 — INSTALL SUBAGENTS

Create `~/.claude/agents/` if it doesn't exist. Write each to: `~/.claude/agents/[agent-name].md`

### 6a — VoltAgent: Business & Product Agents (18 agents)

Fetch from: `https://raw.githubusercontent.com/VoltAgent/awesome-claude-code-subagents/main/categories/[path]`

| Agent name | Fetch path | What it does |
|------------|-----------|--------------|
| frontend-developer | 01-core-development/frontend-developer.md | React/Vue/Angular UI specialist |
| fullstack-developer | 01-core-development/fullstack-developer.md | End-to-end feature development |
| ui-designer | 01-core-development/ui-designer.md | Visual design and interaction |
| debugger | 04-quality-security/debugger.md | Advanced debugging specialist |
| code-reviewer | 04-quality-security/code-reviewer.md | Code quality guardian |
| qa-expert | 04-quality-security/qa-expert.md | Test automation specialist |
| ai-writing-auditor | 04-quality-security/ai-writing-auditor.md | AI writing pattern detector |
| product-manager | 08-business-product/product-manager.md | Product strategy expert |
| content-marketer | 08-business-product/content-marketer.md | Content marketing specialist |
| technical-writer | 08-business-product/technical-writer.md | Technical documentation expert |
| ux-researcher | 08-business-product/ux-researcher.md | User research expert |
| business-analyst | 08-business-product/business-analyst.md | Requirements and analysis specialist |
| project-manager | 08-business-product/project-manager.md | Project management expert |
| wordpress-master | 08-business-product/wordpress-master.md | WordPress development expert |
| research-analyst | 10-research-analysis/research-analyst.md | Comprehensive research specialist |
| project-idea-validator | 10-research-analysis/project-idea-validator.md | Brutal go/no-go product validator |
| competitive-analyst | 10-research-analysis/competitive-analyst.md | Competitive intelligence specialist |
| market-researcher | 10-research-analysis/market-researcher.md | Market analysis and consumer insights |

### 6b — Developer Specialist Agents (52 agents)

Fetch from: `https://raw.githubusercontent.com/Neens6655/claude-code-powerkit/master/agents/[filename]`

| Agent name | Filename | What it does |
|------------|----------|--------------|
| architect | architect.md | System design, architecture decisions |
| code-reviewer | code-reviewer.md | Deep code quality review |
| debugger | debugger.md | Root cause debugging specialist |
| refactorer | refactorer.md | Code cleanup and restructuring |
| nextjs-expert | nextjs-expert.md | Next.js 15, App Router, Server Components |
| react-expert | react-expert.md | React 19, hooks, performance |
| fastapi-expert | fastapi-expert.md | FastAPI, Python async APIs |
| django-expert | django-expert.md | Django, ORM, REST framework |
| vue-expert | vue-expert.md | Vue 3, Composition API |
| svelte-expert | svelte-expert.md | SvelteKit, Svelte 5 |
| astro-expert | astro-expert.md | Astro, islands architecture |
| nestjs-expert | nestjs-expert.md | NestJS, TypeScript backend |
| python-expert | python-expert.md | Python 3.12+, modern patterns |
| typescript-expert | typescript-expert.md | TypeScript strict mode, advanced types |
| javascript-expert | javascript-expert.md | Modern JS, ES2024, patterns |
| go-expert | go-expert.md | Go, concurrency, idiomatic patterns |
| rust-expert | rust-expert.md | Rust, ownership, systems programming |
| postgresql-expert | postgresql-expert.md | PostgreSQL, query optimization, indexes |
| mongodb-expert | mongodb-expert.md | MongoDB, aggregations, schema design |
| redis-expert | redis-expert.md | Redis, caching strategies, pub/sub |
| database-architect | database-architect.md | Database design, normalization, scaling |
| playwright-expert | playwright-expert.md | Playwright E2E testing |
| security-auditor | security-auditor.md | Security review, OWASP |
| accessibility-expert | accessibility-expert.md | WCAG, screen readers, a11y |
| e2e-testing-expert | e2e-testing-expert.md | End-to-end test strategy |
| performance-engineer | performance-engineer.md | Web performance, Core Web Vitals |
| aws-expert | aws-expert.md | AWS services, IAM, deployment |
| cicd-expert | cicd-expert.md | CI/CD pipelines, GitHub Actions |
| devops-engineer | devops-engineer.md | DevOps practices, containers |
| kubernetes-expert | kubernetes-expert.md | Kubernetes, Helm, orchestration |
| terraform-expert | terraform-expert.md | Terraform, IaC, cloud provisioning |
| technical-writer-dev | technical-writer-dev.md | Technical documentation for devs |
| api-documenter | api-documenter.md | API documentation, OpenAPI |
| code-documenter | code-documenter.md | Inline docs, JSDoc, docstrings |
| prd-writer | prd-writer.md | Product requirements documents |
| tech-lead | tech-lead.md | Technical leadership, decisions |
| ui-components-expert | ui-components-expert.md | UI component library design |
| ux-designer | ux-designer.md | UX flows, user experience |
| seo-expert | seo-expert.md | SEO implementation, Core Web Vitals |
| payment-expert | payment-expert.md | Stripe, payment flows, PCI |
| react-native-expert | react-native-expert.md | React Native, Expo, mobile |
| flutter-expert | flutter-expert.md | Flutter, Dart, cross-platform |
| ai-engineer | ai-engineer.md | AI integration, LLM APIs |
| data-engineer | data-engineer.md | Data pipelines, ETL, warehouses |
| ml-engineer | ml-engineer.md | ML models, training, deployment |
| devsecops-engineer | devsecops-engineer.md | Security in CI/CD pipelines |
| security-pentester | security-pentester.md | Penetration testing, vulnerabilities |
| graphql-expert | graphql-expert.md | GraphQL schema, resolvers, Apollo |
| websocket-expert | websocket-expert.md | WebSockets, real-time, Socket.io |
| bi-expert | bi-expert.md | Business intelligence, dashboards |
| technical-writer | technical-writer.md | Technical writing, docs |
| project-manager | project-manager.md | Project planning, Agile, delivery |

---

## STEP 7 — WRITE GLOBAL CLAUDE.MD

Write to `~/.claude/CLAUDE.md`. Do NOT overwrite if the file already exists and has content.

```markdown
# My Projects

## Default Stack
- Frontend: React 19 + Tailwind v4 + TypeScript (strict mode always)
- Package manager: bun (never npm or yarn)
- Testing: Vitest (frontend), pytest (Python)
- API: Hono (bridge layers) or FastAPI (Python-native)

## Design System
- Activate with /design for any UI work
- Fonts: IBM Plex Mono (primary), IBM Plex Sans (secondary)
- Bauhaus aesthetic: 0 border-radius, 2px solid borders, geometric

## Code Standards
- TypeScript strict mode always
- No barrel imports
- Server Components preferred in Next.js
- Error boundaries on every async route
- Never start dev servers on port 3000/3001 — scan for a free port first

## Quality Gates (mandatory before calling anything "done")
- Build passes locally (exit 0)
- Playwright screenshots at 1440px (desktop) + 375px (mobile)
- Zero console errors
- Core user flow completes end-to-end

## Model Routing (for subagents)
| Task | Model |
|------|-------|
| Architecture, security, final verdicts | opus |
| Implementation, code review | sonnet |
| Grep, lint, format, tests, file lookup | haiku |

## Learning Mode
Run /sensei before every code task. Teach the concept, ask a prediction, wait for my answer. Kill switch: #noteach in any prompt.
```

---

## STEP 8 — VERIFY + REPORT

Run this test to confirm Playwright works (no API key needed):

```
Take a Playwright screenshot of https://example.com and save it
```

Then print this summary:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✅ CLAUDE CODE POWERKIT — SETUP COMPLETE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📦 INSTALLED
  ✓ 10 MCP servers configured
  ✓ 30 curated skills
  ✓ 24 Composio community skills
  ✓ 70 subagents (18 VoltAgent + 52 developer specialists)
  ✓ npm/yarn block hook active — bun enforced
  ✓ ZGNAL Design System (built-in style system, no setup needed)
  ✓ Global CLAUDE.md written

🚀 START HERE — try these in order:

  Step 1 — Prove it works right now (no key needed):
    "Take a Playwright screenshot of google.com"

  Step 2 — Plan your first project [BEGINNER]:
    /prd
    → Claude interviews you and writes a full requirements doc

  Step 3 — See the design system [BEGINNER]:
    /design a landing page for my project
    → React + Tailwind UI, production-ready, professional style

  Step 4 — Get expert feedback on your idea [BEGINNER]:
    /plato quick [describe your idea in one sentence]
    → 3 advisors debate it in under 2 minutes

  When you're ready to build:
    /kickoff    — architect + build + review in one flow [BEGINNER]
    /autopilot  — describe it, Claude ships it [INTERMEDIATE]
    /sensei     — turns every code task into a CS lesson [BEGINNER]

  Advanced (require additional deps or paid keys):
    /video-forge  — TTS video pipeline [ADVANCED — needs ffmpeg + Remotion + voice API]
    /loki-mode    — autonomous multi-agent startup system [ADVANCED]

🔑 API KEYS — add to unlock more tools

  ✅ FREE NOW — works without any key:
      Playwright  — screenshots + browser automation (already working)
      Memory      — remembers facts across sessions (already working)

  🔓 GET THESE FIRST — 5 min each, free tier:
      Brave Search  → https://api.search.brave.com        2,000 searches/mo free
      GitHub        → https://github.com/settings/tokens   free, select "repo" scope

  ⚡ ADD WHEN YOU NEED THEM:
      Firecrawl   → https://firecrawl.dev                500 pages/mo free
      OpenRouter  → https://openrouter.ai/keys           100+ LLMs incl. Gemini + GPT-4o
      Perplexity  → https://perplexity.ai/settings/api
      Replicate   → https://replicate.com/account/api-tokens
      Apify       → https://apify.com                    free tier
      Google Maps → https://console.cloud.google.com     $200 credit

  Where to add them:
    macOS:   ~/Library/Application Support/Claude/claude_desktop_config.json
    Windows: %APPDATA%\Claude\claude_desktop_config.json
    Replace each YOUR_*_KEY placeholder with the real key.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```
