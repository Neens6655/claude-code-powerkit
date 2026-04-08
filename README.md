# Claude Code Powerkit

[![Skills](https://img.shields.io/badge/skills-48%2B_installable-4A90D9?style=flat-square)](SKILLS.md)
[![MCP Servers](https://img.shields.io/badge/MCP_servers-12_configured-27AE60?style=flat-square)](MCP-SERVERS.md)
[![License](https://img.shields.io/badge/license-MIT-orange?style=flat-square)](LICENSE)
[![Claude Code](https://img.shields.io/badge/works_with-Claude_Code-blueviolet?style=flat-square)](https://docs.anthropic.com/en/docs/claude-code/overview)

**Most developers spend their first week configuring Claude Code.** This kit skips that week.

Clone, run one script, and get a fully loaded Claude Code environment — battle-tested hooks, 12 MCP servers, 48+ installable skills, and production lessons from 300+ hours of real usage.

---

<!-- To record demo: install VHS (brew install vhs) then run: cd demo && vhs demo.tape -->
<!-- Replace this comment with: ![Setup demo](demo/demo.gif) once recorded -->
> **See it in action**: run `bash setup.sh` → Claude gains web search, browser control, GitHub access, and domain expertise in under 5 minutes.

---

## What Changes After Setup

- Claude **blocks bad deploys** — hooks enforce tests, screenshots, package manager
- Claude has **12 MCP tools** — browser control, web search, GitHub, scraping, AI search, databases
- You get **48+ installable skills** — architecture, design, agents, content, automation
- Claude **remembers your preferences** across sessions via auto-memory
- Claude follows your **stack and conventions** via a pre-configured CLAUDE.md template

## Quick Start

```bash
git clone https://github.com/Neens6655/claude-code-powerkit.git
cd claude-code-powerkit
bash setup.sh        # macOS / Linux / WSL / Git Bash
```

**No API key needed for first test:**
```bash
claude "take a Playwright screenshot of google.com"
```

> **Windows users**: Run in [Git Bash](https://git-scm.com/downloads) or [WSL](https://learn.microsoft.com/en-us/windows/wsl/install). Native PowerShell is not supported.

> **New to Claude Code?** [Install it first](https://docs.anthropic.com/en/docs/claude-code/overview), then come back here.

---

## What You Get

| File | What it does |
|------|-------------|
| `setup.sh` | One-command installer — copies configs, installs Playwright, enables plugins |
| `configs/settings.json` | Hooks (block npm/yarn, flag frontend edits, quality gate on stop) + 6 plugins |
| `configs/CLAUDE.md` | Project instructions template — customize to your stack |
| `configs/mcp.json` | 12 MCP servers pre-configured (fill in your API keys) |
| `configs/rules/` | Frontend + API coding rules Claude follows automatically |
| [SKILLS.md](SKILLS.md) | 48+ installable skills with descriptions and exact install sources |
| [REPOS.md](REPOS.md) | 40+ GitHub repos — skill collections, agents, MCP servers |
| [MCP-SERVERS.md](MCP-SERVERS.md) | 12 MCP server setup guide + free API key sources |
| [TIPS.md](TIPS.md) | 12 hard-won production lessons |

---

## Skills (48+ installable)

Skills are markdown files that give Claude deep domain expertise. Type `/skill-name` to activate.

| Category | Example skills | Count |
|----------|---------------|-------|
| **Planning & Architecture** | `/prd` `/architect` `/kickoff` `/plato` | 5 |
| **Code Quality** | `/verification-before-completion` `/vibe-code-auditor` `/fix` | 7 |
| **Frontend & Design** | `/react-best-practices` `/tailwind-patterns` `/typescript-expert` `/design` | 11 |
| **Agents & MCP** | `/claude-api` `/agent-sdk-dev` `/mcp-builder` `/voice-agents` `/loki-mode` | 8 |
| **Workflow & Automation** | `/behavioral-modes` `/hierarchical-agent-memory` `/checkpoint` | 6 |
| **Content & Media** | `/beautiful-prose` `/baoyu-image-gen` `/baoyu-infographic` `/data-storytelling` | 9 |
| **Business & SaaS** | `/micro-saas-launcher` `/viral-generator-builder` `/marketing-psychology` | 4 |
| **Utilities** | `/eval` `/feedback-loop` `/simplify` `/claude-md-management` | 6 |

**[→ Full catalog with descriptions and install commands](SKILLS.md)**

---

## MCP Servers (12 pre-configured)

| Server | What it gives Claude | Free tier |
|--------|---------------------|-----------|
| **Playwright** | Browser control — screenshots, testing, scraping | Free |
| **Brave Search** | Real-time web search | 2k/month |
| **GitHub** | Create PRs, manage issues, push files | Unlimited |
| **Exa** | AI-native semantic search | 1k/month |
| **Perplexity** | Search + AI reasoning | ~$5/month |
| **Firecrawl** | Structured web scraping | 500 pages/month |
| **Apify** | 4,000+ scraping actors (social, e-commerce, maps) | $5/month |
| **Google Maps** | Places, geocoding, routing | $200 credit/month |
| **OpenAI** | GPT-4o and DALL-E access | Pay-as-you-go |
| **Supabase** | Postgres + auth + storage | 2 projects |
| **Sentry** | Production error monitoring | 5k events/month |
| **Memory** | Persistent cross-session knowledge | Free |

**[→ Setup guide with JSON configs and API key links](MCP-SERVERS.md)**

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

Most skills live in mega-collection repos. See [REPOS.md](REPOS.md) for all sources, or [SKILLS.md](SKILLS.md) for exact install commands per skill.

---

## Quick Setup Checklist

#### Phase 1 — Foundation
- [ ] Install Claude Code ([CLI, VS Code, or Desktop](https://docs.anthropic.com/en/docs/claude-code/overview))
- [ ] Install Node.js 18+, git, and bun
- [ ] Run: `bash setup.sh`
- [ ] Immediate test (no key needed): `claude "take a Playwright screenshot of google.com"`

#### Phase 2 — MCP Servers
- [ ] Copy `configs/mcp.json` to your project as `.mcp.json`
- [ ] Get free API keys — start with [Brave Search](https://brave.com/search/api) + [GitHub PAT](https://github.com/settings/tokens) (5 min)
- [ ] Add `.mcp.json` to `.gitignore`

#### Phase 3 — Skills
- [ ] Open [SKILLS.md](SKILLS.md), install the top 10 from the priority list
- [ ] Copy each `SKILL.md` to `~/.claude/skills/[name]/`

#### Phase 4 — Verify
- [ ] `claude "what skills and MCP tools do you have?"`
- [ ] `claude "search the web for latest Claude Code news"`

---

## Requirements

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code/overview) — CLI, VS Code, or Desktop
- Anthropic API key (`claude auth login`)
- Node.js 18+, git
- macOS, Linux, or Windows (Git Bash/WSL)

---

## Repository Structure

```
claude-code-powerkit/
├── setup.sh              # One-command installer
├── README.md             # This file
├── SKILLS.md             # 48+ skills with install sources
├── MCP-SERVERS.md        # 12 MCP server setup guide
├── REPOS.md              # 40+ GitHub repos to explore
├── TIPS.md               # 12 production lessons
├── demo/
│   └── demo.tape         # VHS script — run to generate demo GIF
└── configs/
    ├── settings.json     # Hooks + plugins
    ├── CLAUDE.md         # Project instructions template
    ├── mcp.json          # 12 MCP server configs
    └── rules/
        ├── frontend.md
        └── api.md
```

---

*Built by [ZGNAL Studio](https://github.com/Neens6655). 300+ hours of production Claude Code usage in one setup. If this saved you time, ⭐ star it and share it.*
