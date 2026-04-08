# Ziad StarterKit

**Most developers spend their first week configuring Claude Code.** This kit skips that week.

Clone, run one script, and get a fully loaded Claude Code environment with battle-tested hooks, 12 MCP servers, 55+ skills, and production lessons from 300+ hours of real usage.

## What Changes After Setup

- Claude **blocks bad deploys** — hooks enforce tests, screenshots, package manager
- Claude has **12 MCP tools** — browser control, web search, GitHub, scraping, AI search, databases
- You get **55+ curated skills** — architecture, design, trading, agents, content, automation
- Claude **remembers your preferences** across sessions via auto-memory
- Claude knows your **stack and conventions** via a pre-configured CLAUDE.md template

## Quick Start

```bash
git clone https://github.com/Neens6655/ziad-starterkit.git
cd ziad-starterkit
bash setup.sh        # macOS / Linux / WSL / Git Bash
```

> **Windows users**: Run in [Git Bash](https://git-scm.com/downloads) or [WSL](https://learn.microsoft.com/en-us/windows/wsl/install). Native PowerShell is not supported.

> **New to Claude Code?** Install it first — [docs.anthropic.com/en/docs/claude-code/overview](https://docs.anthropic.com/en/docs/claude-code/overview). Then come back here.

---

## What You Get

| File | What it does |
|------|-------------|
| `setup.sh` | One-command installer — copies configs, installs Playwright, enables plugins |
| `configs/settings.json` | Hooks (block npm/yarn, flag frontend edits, quality gate on stop) + 6 plugins enabled |
| `configs/CLAUDE.md` | Project instructions template — customize to your stack |
| `configs/mcp.json` | 12 MCP servers pre-configured (fill in your API keys) |
| `configs/rules/` | Frontend + API coding rules Claude follows automatically |
| [SKILLS.md](SKILLS.md) | 55+ skills catalog with descriptions and install sources |
| [REPOS.md](REPOS.md) | 40+ GitHub repos — skill collections, agents, MCP servers |
| [MCP-SERVERS.md](MCP-SERVERS.md) | Every MCP server worth installing + free API key sources |
| [TIPS.md](TIPS.md) | Hard-won lessons from production |

---

## Skills Overview (55+ available)

Skills are markdown files that give Claude deep domain expertise. Type `/skill-name` in any Claude session to activate.

### Planning & Architecture
| Skill | What it does |
|-------|-------------|
| `/prd` | Interview-driven Product Requirements Document |
| `/architect` | Architecture-first planning with file maps and dependency analysis |
| `/kickoff` | End-to-end build pipeline with approval gates |
| `/app-builder` | Full-stack app from a single brief |
| `/plato` | Multi-advisor AI council — audits, critiques, stress-tests your product |

### Code Quality & Review
| Skill | What it does |
|-------|-------------|
| `/verification-before-completion` | Forces Claude to verify before claiming "done" |
| `/vibe-code-auditor` | Audits AI-generated code for fragility and structural flaws |
| `/lint-and-validate` | Auto linting, static analysis, type checking |
| `/kaizen` | Continuous improvement and error-proofing |
| `/output-skill` | Enforces complete code — no `// ...rest` placeholders |
| `/fix` | Root-cause bug fixing (not guessing) |
| `/explain` | Explains any code, file, or error in plain English |

### Frontend & Design
| Skill | What it does |
|-------|-------------|
| `/react-best-practices` | 40+ React/Next.js performance rules from Vercel Engineering |
| `/tailwind-patterns` | Tailwind v4 CSS-first config patterns |
| `/typescript-expert` | TypeScript strict mode patterns and gotchas |
| `/design` | Complete production-ready design specs with 7 style modes |
| `/scroll-experience` | Parallax, Lenis, GSAP ScrollTrigger immersive experiences |
| `/algorithmic-art` | p5.js generative art with seeded randomness |
| `/shader-programming-glsl` | WebGL vertex/fragment shaders |
| `/canvas-design` | Static visual art output as PNG/PDF |
| `/remotion-best-practices` | React-based video and motion graphics |
| `/web-artifacts-builder` | Complex multi-component Claude.ai HTML artifacts |
| `/frontend-design` | Distinctive production-grade frontend interfaces |

### Agents, MCP & AI Systems
| Skill | What it does |
|-------|-------------|
| `/claude-api` | Build apps with the Claude API or Anthropic Agent SDK |
| `/agent-sdk-dev` | Create full Claude Agent SDK applications from scratch |
| `/mcp-builder` | Build MCP (Model Context Protocol) servers |
| `/voice-agents` | Voice AI agents — speech-to-speech pipelines |
| `/loki-mode` | 100+ autonomous agent system for complex tasks |
| `/multi-agent-brainstorming` | Multi-perspective structured design review |
| `/dispatching-parallel-agents` | Run 2+ independent tasks simultaneously |
| `/subagent-driven-development` | Spec-driven implementation with multiple agents |

### Workflow & Automation
| Skill | What it does |
|-------|-------------|
| `/autopilot` | Brief-to-deployment autonomous pipeline — zero gates |
| `/iterate` | Improve a shipped product based on feedback or audits |
| `/ship` | Deploy with pre-flight checks, smoke tests, live URL verification |
| `/behavioral-modes` | Switch Claude into brainstorm / implement / debug / review / ship mode |
| `/hierarchical-agent-memory` | Scoped memory system that reduces context token spend |
| `/checkpoint` | Save and restore pipeline state for long-running tasks |
| `/cost-tracker` | Per-session token and cost tracking with budget alerts |
| `/inngest` | Serverless background jobs and event-driven workflows |
| `/loop` | Run any command on a recurring interval |

### Content, Media & Data
| Skill | What it does |
|-------|-------------|
| `/beautiful-prose` | Hard-edged writing style — kills AI voice completely |
| `/baoyu-image-gen` | Multi-provider image generation (OpenAI, Google, DashScope) |
| `/baoyu-infographic` | 20 layouts × 17 visual styles for infographics |
| `/baoyu-slide-deck` | Professional slide deck generation from content |
| `/baoyu-cover-image` | Article cover images with 5 visual dimensions |
| `/baoyu-comic` | Knowledge comics in multiple art styles |
| `/data-storytelling` | Transform data into compelling narratives |
| `/claude-d3js-skill` | D3.js interactive data visualization |
| `/videodb-skills` | Upload, transcribe, search, edit AI video |

### Trading & Quantitative Analysis
| Skill | What it does |
|-------|-------------|
| `/backtest` | Comprehensive strategy validation — walk-forward, Monte Carlo, PSR |
| `/autoforge` | Autonomous strategy optimization — designs, tests, improves |
| `/autoresearch` | ML experimentation using Karpathy's autoresearch framework |
| `/quant-analyst` | Quantitative research and signal analysis |
| `/intel` | Trade intelligence system v4 |

### Business & SaaS
| Skill | What it does |
|-------|-------------|
| `/micro-saas-launcher` | Indie hacker SaaS playbook — ship fast |
| `/viral-generator-builder` | Build shareable generator tools that go viral |
| `/marketing-psychology` | Behavioral science applied to marketing decisions |
| `/startup-financial-modeling` | Financial modeling for startups |

### Utilities
| Skill | What it does |
|-------|-------------|
| `/eval` | Deterministic output verification — pass/fail assertions |
| `/feedback-loop` | Capture corrections and turn them into permanent rules |
| `/claude-md-management` | Audit and improve CLAUDE.md files |
| `/claude-code-setup` | Analyze codebase, recommend automations |
| `/simplify` | Review changed code for quality and efficiency |
| `/update-config` | Configure Claude Code hooks and settings |

See [SKILLS.md](SKILLS.md) for full install instructions and sources.

---

## MCP Servers (12 pre-configured)

The `configs/mcp.json` includes configs for:

| Server | What it gives Claude |
|--------|---------------------|
| **Playwright** | Browser control — screenshots, testing, scraping, form filling |
| **Brave Search** | Real-time web search (2k free queries/month) |
| **GitHub** | Create PRs, search code, manage issues, push files |
| **Exa** | AI-native semantic search — better than Google for technical queries |
| **Perplexity** | Search + AI reasoning — deep research questions |
| **Firecrawl** | Structured web scraping and data extraction |
| **Apify** | 4,000+ web scraping actors — social media, e-commerce, maps |
| **Google Maps** | Places search, geocoding, routing, distance matrix |
| **OpenAI** | Access GPT-4o and other OpenAI models from Claude sessions |
| **Supabase** | Postgres database, auth, storage, realtime |
| **Sentry** | Production error monitoring and alerting |
| **Academic Papers** | SSRN + arXiv + Semantic Scholar research search |

See [MCP-SERVERS.md](MCP-SERVERS.md) for detailed setup and free API key sources.

---

## How Skills Work

```bash
# 1. Clone a skill repo
git clone https://github.com/SHADOWPR0/beautiful_prose.git /tmp/beautiful_prose

# 2. Copy SKILL.md to the right location
mkdir -p ~/.claude/skills/beautiful-prose
cp /tmp/beautiful_prose/SKILL.md ~/.claude/skills/beautiful-prose/SKILL.md

# 3. Use it in any Claude session
/beautiful-prose
```

Skills from "collections" live in mega-repos. Clone the repo and copy the folder for each skill you want. See [REPOS.md](REPOS.md) for all sources.

---

## API Keys

| Service | Get it at | Free tier |
|---------|-----------|-----------|
| Brave Search | [brave.com/search/api](https://brave.com/search/api) | 2k queries/month |
| GitHub PAT | [github.com/settings/tokens](https://github.com/settings/tokens) | Unlimited |
| Exa | [exa.ai](https://exa.ai) | 1k searches/month |
| Perplexity | [perplexity.ai/settings/api](https://www.perplexity.ai/settings/api) | ~$5/month |
| Firecrawl | [firecrawl.dev](https://firecrawl.dev) | 500 pages/month |
| Apify | [apify.com](https://apify.com) | $5 free credits/month |
| Google Maps | [console.cloud.google.com](https://console.cloud.google.com) | $200 free credit/month |
| OpenAI | [platform.openai.com/api-keys](https://platform.openai.com/api-keys) | Pay-as-you-go |
| Supabase | [supabase.com](https://supabase.com) | 2 free projects |
| Sentry | [sentry.io](https://sentry.io) | 5k events/month |

> **Security**: Never commit `.mcp.json` to git. Run: `echo '.mcp.json' >> .gitignore`

---

## Quick Setup Checklist

#### Phase 1 — Foundation
- [ ] Install Claude Code ([CLI, VS Code, or Desktop](https://docs.anthropic.com/en/docs/claude-code/overview))
- [ ] Install bun, git, gh
- [ ] Run: `bash setup.sh`
- [ ] Try it now (no API key needed): `claude "take a Playwright screenshot of google.com"`

#### Phase 2 — MCP Servers
- [ ] Copy `configs/mcp.json` to your project as `.mcp.json`
- [ ] Fill in API keys (start with Brave + GitHub PAT — both free, 5 minutes)
- [ ] Add `.mcp.json` to `.gitignore`

#### Phase 3 — Skills
- [ ] Browse [SKILLS.md](SKILLS.md), pick 10 from the priority list
- [ ] Install them: copy `SKILL.md` to `~/.claude/skills/[name]/`

#### Phase 4 — Verify
- [ ] Run: `claude "hello, what skills and MCP tools do you have?"`
- [ ] Test search: `claude "search the web for latest Claude Code news"`

---

## Repository Structure

```
ziad-starterkit/
├── setup.sh              # One-command installer
├── README.md             # This file
├── SKILLS.md             # 55+ skills catalog with install sources
├── MCP-SERVERS.md        # 12 MCP server setup guide
├── REPOS.md              # 40+ GitHub repos to explore
├── TIPS.md               # Production lessons from 300+ hours
└── configs/
    ├── settings.json     # Claude Code hooks + plugins
    ├── CLAUDE.md         # Project instructions template
    ├── mcp.json          # 12 MCP server configs
    └── rules/
        ├── frontend.md   # Frontend coding rules
        └── api.md        # API coding rules
```

---

## Requirements

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code/overview) — CLI, VS Code, or Desktop
- Anthropic API key (set via `claude auth`)
- Node.js 18+ and git
- macOS, Linux, or Windows (via Git Bash/WSL)

---

*Built by [ZGNAL Studio](https://github.com/Neens6655). 300+ hours of production Claude Code usage distilled into one setup. Share freely.*
