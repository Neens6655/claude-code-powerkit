# Claude Code Powerkit

[![Skills](https://img.shields.io/badge/skills-70%2B_installed-4A90D9?style=flat-square)](SKILLS.md)
[![MCP Servers](https://img.shields.io/badge/MCP_servers-11_configured-27AE60?style=flat-square)](MCP-SERVERS.md)
[![Agents](https://img.shields.io/badge/subagents-70_specialists-orange?style=flat-square)](SKILLS.md)
[![License](https://img.shields.io/badge/license-MIT-lightgrey?style=flat-square)](LICENSE)
[![Claude Code](https://img.shields.io/badge/works_with-Claude_Code-blueviolet?style=flat-square)](https://docs.anthropic.com/en/docs/claude-code/overview)

**One paste. Full setup. Skip the first week.**

Install 11 MCP tools, 30 skills, 24 community skills, and 70 specialist subagents — in under 5 minutes. No terminal required.

---

## Before You Start — Install These First

The kit's MCP tools run via `npx`, so **Node.js is the only hard requirement**. Everything else is optional depending on what you build.

### Minimum (required for MCP servers to work)

| Tool | Why | Install |
|------|-----|---------|
| **Node.js v20+** | Powers all 11 MCP servers | See below |
| **Git** | Version control, GitHub MCP | See below |

### Recommended (for building projects)

| Tool | Why | Install |
|------|-----|---------|
| **bun** | Fast package manager (used instead of npm) | See below |
| **GitHub CLI (`gh`)** | Manage repos from the terminal | See below |

### Optional (for specific skills)

| Tool | Needed for | Install |
|------|-----------|---------|
| **Python 3.10+** | Building Python APIs (`/app-builder` with FastAPI) | See below |
| **ffmpeg** | `/video-forge` — video encoding and trimming | See below |

---

### Install on macOS

```bash
# 1. Install Homebrew (package manager for Mac) — skip if you have it
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. Core tools (required)
brew install node git

# 3. Recommended
brew install bun gh

# 4. Optional
brew install python@3.12 ffmpeg
```

### Install on Windows

Open **PowerShell as Administrator** and run:

```powershell
# 1. Core tools (required)
winget install OpenJS.NodeJS.LTS
winget install Git.Git

# 2. Recommended
winget install Oven-sh.Bun
winget install GitHub.cli

# 3. Optional
winget install Python.Python.3.12
winget install Gyan.FFmpeg
```

> After installing, **close and reopen** your terminal so the new commands are found.

### Install on Linux (Ubuntu/Debian)

```bash
# 1. Node.js v20 (required)
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs

# 2. Git (required)
sudo apt-get install -y git

# 3. Recommended
curl -fsSL https://bun.sh/install | bash
sudo apt install gh

# 4. Optional
sudo apt-get install -y python3 python3-pip ffmpeg
```

### Verify everything is ready

```bash
node --version    # should print v20.x.x or higher
git --version     # should print git version 2.x.x
npx --version     # comes with Node — should print a version number
```

If all three print a version number, you're ready to install the kit.

---

## Quick Start (paste this into Claude Code)

Open **Claude Code** (Desktop app, VS Code extension, or web), then paste:

```
Set me up using https://raw.githubusercontent.com/Neens6655/claude-code-powerkit/master/BOOTSTRAP.md
```

Claude installs everything automatically. No terminal. No manual steps.

**First test (no API key needed):**
```
Take a Playwright screenshot of google.com
```

---

## What Gets Installed

### 11 MCP Servers

| Server | What it does | Free tier |
|--------|-------------|-----------|
| **Playwright** | Browser automation + screenshots | ✓ No key needed |
| **Memory** | Remembers facts across sessions | ✓ No key needed |
| **Brave Search** | Real-time web search | 2,000/mo free |
| **GitHub** | Create PRs, manage repos, push code | ✓ Free |
| **Perplexity** | AI-powered research and synthesis | Free tier |
| **Firecrawl** | Convert any website to structured data | 500 pages/mo free |
| **Apify** | 4,000+ pre-built web scrapers | Free tier |
| **Google Maps** | Places, directions, geocoding | $200 free credit |
| **OpenRouter** | 100+ LLMs from one key (GPT-4o, Gemini, Llama...) | Free models available |
| **Replicate** | 50,000+ AI models — image, video, audio, 3D | Credits on signup |
| **Gemini** | Google Gemini 2.5 Pro/Flash direct access | Generous free tier |

### 70+ Skills

| Category | Slash commands |
|----------|---------------|
| **Learn** | `/sensei` — teaches CS concepts before every code task |
| **Plan** | `/prd` `/architect` `/kickoff` |
| **Build** | `/app-builder` `/autopilot` `/loki-mode` |
| **AI Council** | `/plato` — 5 advisors debate any decision |
| **Design** | `/design` (ZGNAL Design System) `/canvas-design` `/data-storytelling` |
| **Quality** | `/fix` `/explain` `/vibe-code-auditor` `/iterate` `/feedback-loop` |
| **Writing** | `/beautiful-prose` `/marketing-psychology` |
| **Visuals** | `/baoyu-image-gen` `/baoyu-infographic` |
| **Code** | `/react-best-practices` `/tailwind-patterns` `/typescript-expert` |
| **Business** | `/micro-saas-launcher` `/content-research-writer` `/tailored-resume-generator` |
| **Productivity** | `/file-organizer` `/invoice-organizer` `/meeting-insights-analyzer` |
| **Advanced** | `/dispatching-parallel-agents` `/mcp-builder` `/cheap-route` |

### 70 Specialist Subagents

Agents Claude spawns automatically for deep domain work — installed to `~/.claude/agents/`:

| Category | Agents |
|----------|--------|
| **Business & Product** | product-manager, content-marketer, ux-researcher, business-analyst, project-manager, research-analyst, project-idea-validator, competitive-analyst, market-researcher, wordpress-master |
| **Core Dev** | architect, code-reviewer, debugger, refactorer, tech-lead, prd-writer |
| **Frameworks** | nextjs-expert, react-expert, fastapi-expert, django-expert, vue-expert, svelte-expert, astro-expert, nestjs-expert |
| **Languages** | python-expert, typescript-expert, javascript-expert, go-expert, rust-expert |
| **Database** | postgresql-expert, mongodb-expert, redis-expert, database-architect |
| **Infrastructure** | aws-expert, cicd-expert, devops-engineer, kubernetes-expert, terraform-expert |
| **Quality** | playwright-expert, security-auditor, accessibility-expert, e2e-testing-expert, performance-engineer, qa-expert |
| **Mobile** | react-native-expert, flutter-expert |
| **Data & AI** | ai-engineer, data-engineer, ml-engineer |
| **Security** | devsecops-engineer, security-pentester |
| **Design & UX** | ui-designer, ui-components-expert, ux-designer, frontend-developer, fullstack-developer |
| **Content** | ai-writing-auditor, technical-writer, seo-expert |

### ZGNAL Design System

Production-grade design tokens and component patterns. IBM Plex typography, Bauhaus aesthetic, 300+ CSS variables. Activate with `/design`.

### Sensei Learning Mode

`/sensei` — Before every code task, Claude identifies the key concept at play, asks you to predict the outcome, waits for your answer, then confirms or corrects. Learn CS fundamentals while building. Kill switch: add `#noteach` to any prompt.

### AI Advisory Council (`/plato`)

Spawn 5 advisors — Strategist, Designer, Customer, Contrarian, QA — to debate any product decision. Get a synthesis verdict in under 2 minutes.

---

## API Keys — Priority Order

All free tiers are generous. Start with these:

1. **Brave Search** → [api.search.brave.com](https://api.search.brave.com) — 2,000 free/mo
2. **GitHub** → [github.com/settings/tokens](https://github.com/settings/tokens) — free
3. **Firecrawl** → [firecrawl.dev](https://firecrawl.dev) — 500 pages/mo free
4. **Gemini** → [aistudio.google.com/apikey](https://aistudio.google.com/apikey) — very generous free tier
5. **OpenRouter** → [openrouter.ai/keys](https://openrouter.ai/keys) — free models available
6. **Perplexity** → [perplexity.ai/settings/api](https://www.perplexity.ai/settings/api)
7. **Replicate** → [replicate.com/account/api-tokens](https://replicate.com/account/api-tokens)
8. **Apify** → [apify.com](https://apify.com) — free tier
9. **Google Maps** → [console.cloud.google.com](https://console.cloud.google.com) — $200 credit

---

## Optional: 500+ App Integrations

Connect Gmail, Slack, Notion, Stripe, HubSpot, Jira, Google Drive, and 490+ more via Composio:

1. Sign up free at [composio.dev](https://composio.dev)
2. Tell Claude: `"Install Composio app integrations from https://github.com/ComposioHQ/awesome-claude-skills"`

---

## Manual Setup (terminal users)

```bash
git clone https://github.com/Neens6655/claude-code-powerkit.git
cd claude-code-powerkit
bash setup.sh
```

Copy `configs/mcp.json` → `.mcp.json` in your project root, fill in API keys.

---

## What's in the Repo

```
claude-code-powerkit/
├── BOOTSTRAP.md          ← Paste URL into Claude to auto-install everything
├── README.md
├── setup.sh              ← Terminal alternative
├── configs/
│   ├── settings.json     ← Hooks + permissions + plugins
│   ├── mcp.json          ← 11 MCP server template
│   ├── CLAUDE.md         ← Project instructions template
│   └── rules/            ← Frontend + API coding rules
├── skills/               ← 26 curated skill files
├── design-system/        ← ZGNAL Design System tokens + quick-start
├── MCP-SERVERS.md        ← Detailed MCP setup guide
├── SKILLS.md             ← Full skills catalog
└── TIPS.md               ← 12 production lessons
```

---

## License

MIT. Fork it, share it, use it.
