# Ziad StarterKit

**Most developers spend their first week configuring Claude Code.** This kit skips that week.

Clone, run one script, and get a fully loaded Claude Code environment with battle-tested hooks, MCP servers, skills, and best practices from 200+ hours of production usage.

## What Changes

- Claude blocks you from deploying without passing tests (hook)
- Claude takes Playwright screenshots before you ship any frontend (rule)
- Claude has access to web search, GitHub, academic papers, and browser automation (MCP servers)
- You get 35+ curated skills — from architecture planning to code auditing to parallel agents

## Quick Start

```bash
git clone https://github.com/Neens6655/ziad-starterkit.git
cd ziad-starterkit
bash setup.sh        # macOS/Linux/WSL/Git Bash
```

> **Windows users**: Run in [Git Bash](https://git-scm.com/downloads) or [WSL](https://learn.microsoft.com/en-us/windows/wsl/install). Native PowerShell is not supported yet.

> **New to Claude Code?** It's Anthropic's AI coding assistant that runs in your terminal, VS Code, or as a desktop app. [Install it first](https://docs.anthropic.com/en/docs/claude-code/overview), then come back here.

## What You Get

| File | What it does |
|------|-------------|
| `setup.sh` | One-command installer — copies configs, installs Playwright, enables plugins |
| `configs/settings.json` | Hooks (test before deploy, block npm/yarn) + 6 plugins enabled |
| `configs/CLAUDE.md` | Project instructions template — customize to your stack |
| `configs/mcp.json` | 7 MCP servers ready to go (fill in your API keys) |
| `configs/rules/` | Frontend + API coding rules |
| [SKILLS.md](SKILLS.md) | 35+ skills catalog with install instructions |
| [REPOS.md](REPOS.md) | 25+ GitHub repos to explore |
| [MCP-SERVERS.md](MCP-SERVERS.md) | Every MCP server worth installing + where to get free API keys |
| [TIPS.md](TIPS.md) | 12 hard-won lessons from production |

## Why This Kit vs. Reading the Docs

- **Opinionated defaults** — not a menu, a working config you can customize
- **Battle-tested hooks** — prevent bad deploys, enforce package manager, remind you to test
- **Priority-ordered skills** — don't browse 1000 skills, install 10 that matter
- **Production lessons** — tips you'd learn the hard way after weeks of usage

## How Skills Work

Skills are markdown files that teach Claude domain expertise. They live in `~/.claude/skills/[name]/SKILL.md`.

```bash
# Install a skill from a cloned repo
mkdir -p ~/.claude/skills/beautiful-prose
cp /path/to/beautiful_prose/SKILL.md ~/.claude/skills/beautiful-prose/SKILL.md

# Now use it in any Claude session
# Just type: /beautiful-prose
```

See [SKILLS.md](SKILLS.md) for the full catalog with install commands.

## API Keys

You need your own keys. Most are free:

| Service | Get it at | Free? |
|---------|-----------|-------|
| Brave Search | [brave.com/search/api](https://brave.com/search/api) | 2k queries/month |
| GitHub PAT | [github.com/settings/tokens](https://github.com/settings/tokens) | Unlimited |
| Exa | [exa.ai](https://exa.ai) | 1k searches/month |
| Firecrawl | [firecrawl.dev](https://firecrawl.dev) | 500 pages/month |
| Sentry | [sentry.io](https://sentry.io) | 5k events/month |

After setup, edit `.mcp.json` in your project and replace `YOUR_*` placeholders with your keys.

> **Security**: Never commit `.mcp.json` to git — it contains your API keys. Add it to `.gitignore` immediately.

## Quick Setup Checklist

```
Phase 1: Foundation
[ ] Install Claude Code (CLI, VS Code extension, or Desktop app)
[ ] Install bun, git, gh
[ ] Run: bash setup.sh

Phase 2: Skills
[ ] Browse SKILLS.md, pick 5-10 skills
[ ] Install them (copy SKILL.md to ~/.claude/skills/[name]/)

Phase 3: MCP Servers + API Keys
[ ] Get free API keys (Brave, GitHub PAT, Exa)
[ ] Edit .mcp.json, replace YOUR_* placeholders
[ ] Add .mcp.json to your .gitignore

Phase 4: Verify
[ ] Run: claude "hello, summarize my setup"
[ ] Test: "take a Playwright screenshot of google.com"
```

## Requirements

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code/overview) (CLI, VS Code, or Desktop)
- Anthropic API key (set via `claude auth` or in settings)
- Node.js 18+ and git
- macOS, Linux, or Windows (via Git Bash/WSL)

---

*Built by [ZGNAL Studio](https://github.com/Neens6655). Share freely.*
