# Claude Code Powerkit — Auto-Installer

> **FOR CLAUDE:** A user has pointed you at this file to set up their Claude Code environment.
> Execute every step. Write every file. When complete, print the ✅ summary.
> The user may be non-technical — do the work, don't ask them to do it manually.

---

## What's being installed

- **11 MCP servers** — browser, search, GitHub, research, scraping, AI models, maps, memory
- **26 curated skills** — /design, /plato, /sensei, /autopilot, /prd, /fix, and more
- **26 Composio community skills** — writing, research, productivity, business tools
- **18 VoltAgent subagents** — specialized agents for product, research, dev, QA
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
    "Stop": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "echo 'Tip: screenshot before ship, test before deploy.'"
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
    "gemini": {
      "command": "npx",
      "args": ["-y", "@yuhuangbin/mcp-gemini"],
      "env": { "GEMINI_API_KEY": "YOUR_GEMINI_KEY" }
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

## STEP 6 — INSTALL VOLTAGENT SUBAGENTS

Create `~/.claude/agents/` if it doesn't exist.

For each agent below, fetch from:
`https://raw.githubusercontent.com/VoltAgent/awesome-claude-code-subagents/main/categories/[path]`

Write each to: `~/.claude/agents/[agent-name].md`

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
  ✓ 11 MCP servers configured
  ✓ 26 curated skills installed
  ✓ 24 Composio community skills installed
  ✓ 18 VoltAgent subagents installed
  ✓ Settings + hooks active
  ✓ ZGNAL Design System loaded
  ✓ Global CLAUDE.md written

🔑 API KEYS NEEDED (add to your Claude Desktop config):
  ✓ Playwright    — no key, works now
  ✓ Memory        — no key, works now
  ○ Brave Search  → https://api.search.brave.com       (2,000/mo free)
  ○ GitHub        → https://github.com/settings/tokens  (free)
  ○ Perplexity    → https://perplexity.ai/settings/api
  ○ Firecrawl     → https://firecrawl.dev               (500 pages/mo free)
  ○ Apify         → https://apify.com                   (free tier)
  ○ Google Maps   → https://console.cloud.google.com    ($200 credit)
  ○ OpenRouter    → https://openrouter.ai/keys          (free models available)
  ○ Replicate     → https://replicate.com/account/api-tokens
  ○ Gemini        → https://aistudio.google.com/apikey  (generous free tier)

🚀 TRY THESE NOW:
  "Take a screenshot of google.com"    — works immediately
  /sensei                               — activate inline learning mode
  /prd                                  — write requirements for a new idea
  /design                               — generate UI with the design system
  /plato [your idea]                    — get multi-advisor feedback
  /autopilot                            — describe an app, Claude builds + ships it

📚 OPTIONAL: 500+ App Integrations (Gmail, Slack, Notion, Stripe...)
  Sign up free at composio.dev, then:
  "Install Composio app integrations from https://github.com/ComposioHQ/awesome-claude-skills"

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```
