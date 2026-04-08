# Ziad StarterKit

> Zero to fully loaded Claude Code in 30 minutes.
> Curated from 67 installed skills, 6 plugins, 10 MCP servers, and 200+ hours of production usage.

## Quick Start

```bash
# 1. Clone this repo
git clone https://github.com/Neens6655/ziad-starterkit.git
cd ziad-starterkit

# 2. Run the setup script
bash setup.sh

# 3. Done. Open any project and start using Claude Code.
```

## What You Get

| What | File | Description |
|------|------|-------------|
| Settings | `configs/settings.json` | Hooks, plugins, permissions — copy to `~/.claude/` |
| CLAUDE.md | `configs/CLAUDE.md` | Project instructions template — copy to your project root |
| MCP Servers | `configs/mcp.json` | Playwright, search, GitHub, databases — copy to project as `.mcp.json` |
| Frontend Rules | `configs/rules/frontend.md` | React, Tailwind v4, TypeScript strict — copy to `.claude/rules/` |
| API Rules | `configs/rules/api.md` | Error handling, env validation, CORS — copy to `.claude/rules/` |
| Install Script | `setup.sh` | Installs tools, copies configs, enables plugins |
| Skill Guide | `SKILLS.md` | Top 35+ skills with install sources |
| Repo Guide | `REPOS.md` | 25+ curated GitHub repos to clone |
| MCP Guide | `MCP-SERVERS.md` | Every MCP server worth installing + API key links |
| Pro Tips | `TIPS.md` | Lessons from 200+ hours of production usage |

## Manual Setup (if you prefer)

1. Install prerequisites: `bun`, `git`, `gh`, `python`, Playwright
2. Copy `configs/settings.json` to `~/.claude/settings.json`
3. Copy `configs/CLAUDE.md` to your project root
4. Copy `configs/mcp.json` to your project root as `.mcp.json`
5. Copy `configs/rules/` to your project's `.claude/rules/`
6. Install skills from `SKILLS.md`
7. Get your own API keys (see `MCP-SERVERS.md`)

## File Structure

```
claude-starter-kit/
  configs/
    settings.json        # Global Claude Code settings
    CLAUDE.md            # Project instructions template
    mcp.json             # MCP server config template
    rules/
      frontend.md        # Frontend coding rules
      api.md             # API coding rules
  setup.sh               # One-command installer
  SKILLS.md              # Skill catalog + install guide
  REPOS.md               # GitHub repo catalog
  MCP-SERVERS.md         # MCP server catalog + API keys
  TIPS.md                # Pro tips and lessons learned
  README.md              # This file
```

## Requirements

- Claude Code CLI, VS Code extension, or Desktop app
- Anthropic API key (set via `claude auth`)
- Node.js 18+ (for npx-based MCP servers)
- bun (installed by setup script)
- git + GitHub CLI

## API Keys

**You need your own keys.** All are free tier:

| Service | Get it at | Free? |
|---------|-----------|-------|
| Brave Search | brave.com/search/api | 2k/month |
| GitHub PAT | github.com/settings/tokens | Unlimited |
| Exa | exa.ai | 1k/month |
| Firecrawl | firecrawl.dev | 500 pages/month |
| Supabase | supabase.com | 2 projects |
| Sentry | sentry.io | 5k events/month |
| Perplexity | perplexity.ai/settings/api | $5/month |

---

*Built by [ZGNAL Studio](https://github.com/Neens6655). Share freely.*
