# Skills Catalog

**70+ skills** auto-installed by [BOOTSTRAP.md](BOOTSTRAP.md). Each skill is a markdown file giving Claude deep domain expertise — type `/skill-name` in any session to activate.

---

## How Skills Work

```bash
# Manual install (if not using BOOTSTRAP)
mkdir -p ~/.claude/skills/beautiful-prose
curl -o ~/.claude/skills/beautiful-prose/SKILL.md \
  https://raw.githubusercontent.com/Neens6655/claude-code-powerkit/master/skills/beautiful-prose.md
```

Then in Claude: `/beautiful-prose`

---

## Curated Skills (30 — auto-installed from this repo)

### 🧠 Learning
| Skill | Command | What it does |
|-------|---------|-------------|
| Sensei | `/sensei` | Teaches CS concepts before every code task. Asks predictions. Builds intuition while you build. |

### 🏗️ Planning & Architecture
| Skill | Command | What it does |
|-------|---------|-------------|
| PRD | `/prd` | Interview-driven product requirements doc. Fills every section. |
| Architect | `/architect` | System design, file maps, risk assessment, ADRs. |
| Kickoff | `/kickoff` | Full feature build: architect → design → build → review. |
| App Builder | `/app-builder` | Scaffold any app type from a description. 13 templates. |
| Autopilot | `/autopilot` | Brief → deployed product, zero manual gates. Full pipeline. |

### 🤝 AI Council
| Skill | Command | What it does |
|-------|---------|-------------|
| Plato | `/plato` | Spawn 5 advisors (Strategist, Designer, Customer, Contrarian, QA) to debate any decision. |

### 🎨 Design & Visual
| Skill | Command | What it does |
|-------|---------|-------------|
| Design | `/design` | ZGNAL Design System — Bauhaus aesthetic, IBM Plex, 300+ tokens. |
| Canvas Design | `/canvas-design` | Algorithmic visual art to PNG/PDF. |
| Data Storytelling | `/data-storytelling` | Transform data into compelling narrative + visualization. |
| Video Forge | `/video-forge` | TTS-narrated video pipeline: script → voice clone → timing gate → Remotion render → localize. |
| Algorithmic Art | `/algorithmic-art` | Generative art with p5.js — particles, geometry, noise fields. |
| Scroll Experience | `/scroll-experience` | Cinematic scroll storytelling with Lenis + Framer Motion / GSAP. |

### ✅ Quality & Debug
| Skill | Command | What it does |
|-------|---------|-------------|
| Fix | `/fix` | Trace root cause, explain in plain English, fix scoped. |
| Explain | `/explain` | Any code, file, error in plain English. Layered depth. |
| Vibe Code Auditor | `/vibe-code-auditor` | Catch fragile AI-generated code before it ships. |
| Iterate | `/iterate` | Audit-first improvement for shipped products. |
| Feedback Loop | `/feedback-loop` | Capture corrections → extract rule → future sessions respect it. |

### ✍️ Writing & Content
| Skill | Command | What it does |
|-------|---------|-------------|
| Beautiful Prose | `/beautiful-prose` | Hard-edged writing style. Kill generic AI voice. |
| Marketing Psychology | `/marketing-psychology` | Behavioral science copy. Mental models for conversion. |
| Baoyu Infographic | `/baoyu-infographic` | Research-backed infographics. 18 visual styles. |
| Baoyu Image Gen | `/baoyu-image-gen` | AI image generation across multiple providers. |

### 💻 Code Expertise
| Skill | Command | What it does |
|-------|---------|-------------|
| React Best Practices | `/react-best-practices` | 40+ Vercel-level performance rules for React/Next.js. |
| Tailwind Patterns | `/tailwind-patterns` | Tailwind v4 CSS-first patterns. `@theme {}` in CSS. |
| TypeScript Expert | `/typescript-expert` | Deep TypeScript — narrowing, generics, strict patterns. |

### 🚀 Advanced & Automation
| Skill | Command | What it does |
|-------|---------|-------------|
| Loki Mode | `/loki-mode` | Autonomous multi-agent startup system. |
| Dispatching Parallel Agents | `/dispatching-parallel-agents` | Run 2+ independent tasks simultaneously. |
| MCP Builder | `/mcp-builder` | Build custom MCP servers from scratch. |
| Micro SaaS Launcher | `/micro-saas-launcher` | End-to-end SaaS launch framework. |
| Cheap Route | `/cheap-route` | Route non-critical tasks to cheaper models. Save quota. |

---

## Composio Community Skills (24 — auto-installed from ComposioHQ)

Source: [github.com/ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills)

| Skill | What it does |
|-------|-------------|
| `artifacts-builder` | Multi-component HTML/React artifact creation |
| `brand-guidelines` | Apply brand standards to any output |
| `changelog-generator` | Auto-generate release notes from git commits |
| `competitive-ads-extractor` | Analyze competitor advertising strategies |
| `content-research-writer` | Research-backed writing with citations |
| `developer-growth-analysis` | Dev productivity and growth insights |
| `document-skills` | Document processing workflows |
| `domain-name-brainstormer` | Generate and validate domain name ideas |
| `file-organizer` | Intelligent file organization |
| `image-enhancer` | Image quality improvement |
| `internal-comms` | Company communication templates |
| `invoice-organizer` | Tax-ready invoice management |
| `lead-research-assistant` | Lead qualification and outreach |
| `meeting-insights-analyzer` | Meeting pattern and insights analysis |
| `raffle-winner-picker` | Cryptographically secure winner selection |
| `skill-creator` | Build new Claude skills from scratch |
| `skill-share` | Package and share your skills |
| `slack-gif-creator` | Slack-optimized GIF generation |
| `tailored-resume-generator` | Job-matched resume creation |
| `theme-factory` | Font and color theme presets |
| `twitter-algorithm-optimizer` | Tweet optimization for engagement |
| `video-downloader` | YouTube and platform video downloads |
| `webapp-testing` | Playwright-based web app testing |
| `template-skill` | Skill scaffolding template |

---

## VoltAgent Subagents (18 — auto-installed)

Source: [github.com/VoltAgent/awesome-claude-code-subagents](https://github.com/VoltAgent/awesome-claude-code-subagents)

These are specialist agents Claude spawns for deep domain work. They go to `~/.claude/agents/`.

| Agent | Category | What it does |
|-------|----------|-------------|
| `frontend-developer` | Development | React/Vue/Angular UI specialist |
| `fullstack-developer` | Development | End-to-end feature development |
| `ui-designer` | Development | Visual design and interaction |
| `debugger` | Quality | Advanced debugging specialist |
| `code-reviewer` | Quality | Code quality guardian |
| `qa-expert` | Quality | Test automation specialist |
| `ai-writing-auditor` | Quality | Detect and rewrite AI writing patterns |
| `product-manager` | Business | Product strategy and roadmap |
| `content-marketer` | Business | Content marketing specialist |
| `technical-writer` | Business | Technical documentation expert |
| `ux-researcher` | Business | User research and interviews |
| `business-analyst` | Business | Requirements and analysis |
| `project-manager` | Business | Project management and coordination |
| `wordpress-master` | Business | WordPress development + optimization |
| `research-analyst` | Research | Comprehensive research specialist |
| `project-idea-validator` | Research | Brutal go/no-go product validator |
| `competitive-analyst` | Research | Competitive intelligence |
| `market-researcher` | Research | Market analysis and consumer insights |

---

## Optional: 500+ App Integrations (Composio)

Connect Gmail, Slack, Notion, Stripe, HubSpot, Jira, Google Drive, and 490+ more:

1. Sign up free at [composio.dev](https://composio.dev)
2. Tell Claude: `"Install Composio app integrations from https://github.com/ComposioHQ/awesome-claude-skills"`
