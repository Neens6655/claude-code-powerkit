# Skills Catalog

**48 installable skills** + 7 inspiration-only skills listed at the bottom. Each skill is a markdown file that gives Claude deep expertise in a domain — type `/skill-name` in any session to activate it.

## How to Install Skills

```bash
# Method 1: From a dedicated repo
git clone https://github.com/SHADOWPR0/beautiful_prose.git /tmp/beautiful_prose
mkdir -p ~/.claude/skills/beautiful-prose
cp /tmp/beautiful_prose/SKILL.md ~/.claude/skills/beautiful-prose/SKILL.md

# Method 2: From a collection repo (most skills live in these)
git clone https://github.com/alirezarezvani/claude-skills.git /tmp/claude-skills
mkdir -p ~/.claude/skills/my-skill
cp /tmp/claude-skills/my-skill/SKILL.md ~/.claude/skills/my-skill/SKILL.md

# Use it in any Claude session
/my-skill
```

> **"Collections"** = skills found in [alirezarezvani/claude-skills](https://github.com/alirezarezvani/claude-skills), [VoltAgent/awesome-agent-skills](https://github.com/VoltAgent/awesome-agent-skills), or [hesreallyhim/awesome-claude-code](https://github.com/hesreallyhim/awesome-claude-code). See [REPOS.md](REPOS.md) for all sources.

> **"Built-in plugin"** = these are Claude Code plugins, not file-based skills. Enable them with `claude plugin enable [name]` or via settings.json.

> **"Author's custom"** = from this kit's author. Not publicly available standalone — listed so you know what's possible.

---

## First Day Gotchas

1. **MCP tools are deferred** — Claude doesn't load MCP schemas until needed. If a tool isn't working, say: *"load the Playwright tools"* — Claude will find and load it.
2. **Files over 2,000 lines get silently truncated** — The Read tool caps at 2k lines with no warning. Ask Claude to check `wc -l <file>` first and read in chunks.
3. **Skills need exact folder names** — The folder name becomes the slash command. `~/.claude/skills/beautiful-prose/SKILL.md` → `/beautiful-prose`.

---

## Priority Install Order (Top 10)

If you can only install 10 skills, start here:

| # | Skill | Why | Install |
|---|-------|-----|---------|
| 1 | `/react-best-practices` | 40+ Vercel perf rules — catches common mistakes | Collections |
| 2 | `/verification-before-completion` | Stops Claude from shipping broken code | [obra/superpowers](https://github.com/obra/superpowers) |
| 3 | `/beautiful-prose` | Kills AI voice in writing output | [SHADOWPR0/beautiful_prose](https://github.com/SHADOWPR0/beautiful_prose) |
| 4 | `/tailwind-patterns` | Tailwind v4 the right way (CSS-first) | Collections |
| 5 | `/typescript-expert` | Strict TypeScript patterns that don't bite later | Collections |
| 6 | `/dispatching-parallel-agents` | 2-3x speed on multi-task work | [obra/superpowers](https://github.com/obra/superpowers) |
| 7 | `/vibe-code-auditor` | Catches fragile AI code before it ships | Collections |
| 8 | `/behavioral-modes` | brainstorm/implement/debug/review/ship modes | Collections |
| 9 | `/mcp-builder` | Build your own MCP tools for Claude | Collections |
| 10 | `/hierarchical-agent-memory` | Scoped memory reduces token spend significantly | [kromahlusenii-ops/ham](https://github.com/kromahlusenii-ops/ham) |

---

## Planning & Architecture

| Skill | What it does | Install from |
|-------|-------------|-------------|
| `/prd` | Interactive interview that produces a production-ready PRD. Asks the right questions before you write a line of code. | Collections |
| `/architect` | Architecture-first planning — file maps, dependency analysis, trade-off comparisons. Returns a step-by-step plan before touching code. | Collections |
| `/kickoff` | Chains architect + design + code-review into one pipeline with approval gates at each phase. | Collections |
| `/app-builder` | Orchestrates a full-stack app build from a single brief — frontend, API, database, tests. | Collections |
| `/plato` | Spawns a multi-advisor AI council (Strategist, Architect, Designer, Quant, Contrarian, QA). Full debate + synthesis. Use before major decisions. | Collections / [Neens6655/plato](https://github.com/Neens6655/plato) |
| `/multi-agent-brainstorming` | Structured design review from multiple perspectives. Faster than full Plato. | Collections |

---

## Code Quality & Review

| Skill | What it does | Install from |
|-------|-------------|-------------|
| `/verification-before-completion` | Forces Claude to actually run the code and verify output before claiming it's done. Eliminates "it should work" answers. | [obra/superpowers](https://github.com/obra/superpowers) |
| `/vibe-code-auditor` | Audits rapidly-generated or AI-produced code for structural flaws, fragile patterns, missing error handling, and security gaps. | Collections |
| `/lint-and-validate` | Auto linting, static analysis, type checking — runs the full quality suite and reports issues. | Collections |
| `/kaizen` | Continuous improvement framework. Finds patterns in repeated mistakes and standardizes fixes. | Collections |
| `/output-skill` | Overrides Claude's truncation behavior. Forces complete code generation — no `// ...rest of code` placeholders. | Collections |
| `/fix` | Root-cause bug fixing. Reads the error, traces the cause, fixes the actual problem (not symptoms). | Collections |
| `/explain` | Explains any code, file, project structure, or error in plain English. Adapts to your level. | Collections |
| `/simplify` | Reviews recently changed code for reuse, quality, and efficiency. Removes unnecessary complexity. | Built-in plugin |

---

## Frontend & Design

| Skill | What it does | Install from |
|-------|-------------|-------------|
| `/react-best-practices` | 40+ React/Next.js performance rules from Vercel Engineering. Covers Server Components, hydration, lazy loading, bundle size. | Collections |
| `/tailwind-patterns` | Tailwind v4 CSS-first configuration patterns. `@theme {}` blocks, container queries, responsive utilities. | Collections |
| `/typescript-expert` | TypeScript strict mode patterns — generic constraints, discriminated unions, template literals, inference gotchas. | Collections |
| `/design` | Complete production-ready design spec for any app. 7 style modes: bauhaus, editorial, brutalist, agency, glass, dark, custom. 96 palettes, 57 font pairings. | Collections |
| `/frontend-design` | Creates distinctive, high-design frontend interfaces. Anti-slop rules, visual hierarchy, motion principles. | Built-in plugin |
| `/scroll-experience` | Expert in immersive scroll-driven experiences — parallax storytelling, sticky sections, Lenis + GSAP ScrollTrigger. | [vibeforge1111/vibeship-spawner-skills](https://github.com/vibeforge1111/vibeship-spawner-skills) |
| `/algorithmic-art` | p5.js generative art with seeded randomness. Creates interactive, reproducible visual pieces. | Collections |
| `/shader-programming-glsl` | WebGL vertex and fragment shaders — particles, distortion, post-processing effects. | Collections |
| `/canvas-design` | Static visual art exported as PNG/PDF using design philosophy and layout principles. | Collections |
| `/remotion-best-practices` | React-based programmatic video — data story videos, animated charts, captions, compositions. | Collections |
| `/web-artifacts-builder` | Suite for creating elaborate multi-component Claude.ai HTML artifacts. | Collections |
| `/stitch-skill` | Google Stitch semantic design system — agent-friendly component tokens. | Collections |

---

## Agents, MCP & AI Systems

| Skill | What it does | Install from |
|-------|-------------|-------------|
| `/claude-api` | Build production apps with the Claude API or Anthropic Agent SDK. Covers tool use, streaming, multi-turn, structured output. | Built-in plugin |
| `/agent-sdk-dev` | Create full Claude Agent SDK applications. Sets up the project, wires tools, handles orchestration. | Built-in plugin |
| `/mcp-builder` | Guide for creating high-quality MCP servers — schema design, tool documentation, testing, publishing. | Collections |
| `/voice-agents` | Voice AI agent pipelines — STT → LLM → TTS. Real-time conversation, interruption handling, latency optimization. | [vibeforge1111/vibeship-spawner-skills](https://github.com/vibeforge1111/vibeship-spawner-skills) |
| `/loki-mode` | Multi-agent autonomous system for complex tasks. Spawns 100+ specialized agents. Full hands-off execution. | Collections |
| `/dispatching-parallel-agents` | Runs 2+ independent tasks simultaneously. Structured task decomposition, parallel execution, result synthesis. | [obra/superpowers](https://github.com/obra/superpowers) |
| `/subagent-driven-development` | Spec-driven implementation. Breaks work into independent tasks, assigns to subagents, reviews output. | [obra/superpowers](https://github.com/obra/superpowers) |
| `/multi-agent-brainstorming` | Structured multi-perspective design review. Multiple "agents" argue from different positions, then synthesize. | Collections |

---

## Workflow & Automation

| Skill | What it does | Install from |
|-------|-------------|-------------|
| `/behavioral-modes` | Switches Claude into focused operational modes: brainstorm (divergent, no code) / implement / debug / review / ship. | Collections |
| `/hierarchical-agent-memory` | Scoped CLAUDE.md memory system. Creates project-level memory that doesn't bloat global context. | [kromahlusenii-ops/ham](https://github.com/kromahlusenii-ops/ham) |
| `/checkpoint` | Save and restore pipeline state for long-running multi-phase tasks. Resume after interruption. | Collections |
| `/cost-tracker` | Per-session token and cost tracking. Cumulative dashboard — daily/weekly/monthly spend, skill-level breakdown. | Collections |
| `/inngest` | Serverless-first background jobs and event-driven workflows with Inngest. Retries, fan-out, scheduling. | Collections |
| `/loop` | Run any slash command on a recurring interval. `/loop 5m /some-command` polls every 5 minutes. | Collections |
| `/update-config` | Configure Claude Code hooks, permissions, and plugins via settings.json. | Collections |

---

## Content, Media & Data

| Skill | What it does | Install from |
|-------|-------------|-------------|
| `/beautiful-prose` | Hard-edged writing style contract. Kills generic AI voice — produces forceful, specific, timeless prose. | [SHADOWPR0/beautiful_prose](https://github.com/SHADOWPR0/beautiful_prose) |
| `/baoyu-image-gen` | Multi-provider image generation — OpenAI DALL-E, Google Imagen, DashScope. Prompt engineering included. | baoyu collection (search GitHub: `baoyu claude skills`) |
| `/baoyu-infographic` | 20 layout types × 17 visual styles. Professional infographic generation from data or text. | baoyu collection |
| `/baoyu-slide-deck` | Generates professional slide deck images from content outlines. | baoyu collection |
| `/baoyu-cover-image` | Article cover images — 5 visual dimensions: type, palette, render style, mood, composition. | baoyu collection |
| `/baoyu-comic` | Knowledge comics in multiple art styles and tones. Educational content made visual. | baoyu collection |
| `/baoyu-markdown-to-html` | Converts Markdown to styled HTML. WeChat-compatible themes included. | baoyu collection |
| `/data-storytelling` | Transforms data into compelling narratives. Context, visualization, and stakeholder framing. | Collections |
| `/claude-d3js-skill` | D3.js interactive data visualization. Force graphs, treemaps, animated transitions, custom scales. | Collections |
| `/videodb-skills` | Upload, stream, search, edit, transcribe AI video via VideoDB. | Collections |

---

## Business & SaaS

| Skill | What it does | Install from |
|-------|-------------|-------------|
| `/micro-saas-launcher` | Indie hacker SaaS playbook — validate, build, launch, monetize. Fast and lean. | [vibeforge1111/vibeship-spawner-skills](https://github.com/vibeforge1111/vibeship-spawner-skills) |
| `/viral-generator-builder` | Builds shareable generator tools — name generators, quizzes, calculators that go viral. | [vibeforge1111/vibeship-spawner-skills](https://github.com/vibeforge1111/vibeship-spawner-skills) |
| `/marketing-psychology` | Applies behavioral science and mental models to marketing — pricing, copy, funnel design. | Collections |
| `/startup-financial-modeling` | Financial modeling for startups — unit economics, cohort analysis, runway projections. | Collections |

---

## Utilities & Meta-Skills

| Skill | What it does | Install from |
|-------|-------------|-------------|
| `/eval` | Deterministic output verification. Runs automated checks (not LLM judgment) — pass/fail assertions on any output. | Collections |
| `/feedback-loop` | Captures corrections and extracts permanent rules. "Don't do X again" → stored in `corrections/` → future sessions respect it. | Collections |
| `/claude-md-management` | Audits and improves CLAUDE.md files. Finds gaps, adds missing rules, reorganizes structure. | Built-in plugin |
| `/claude-code-setup` | Analyzes a codebase and recommends Claude Code automations — hooks, subagents, memory patterns. | Built-in plugin |
| `/audit-design` | Comprehensive visual design QA using Playwright. Screenshots, WCAG contrast checks, font checks, mobile nav. | Collections |
| `/release-skills` | Universal release workflow — auto-detects version files, generates changelogs, tags, pushes. | Collections |

---

## Author's Custom Skills — Inspiration Only

> These skills are **not publicly available** as standalone installs. They're listed so you know what's possible to build with the Claude Skill system. Use them as blueprints for your own custom skills.

| Skill | What it does | Why it's listed |
|-------|-------------|----------------|
| `/autopilot` | Brief-to-deployment autonomous pipeline. Zero gates — give a brief, get a shipped product. | Shows what a full "hands-off build" skill looks like |
| `/iterate` | Audit-first improvement cycle for shipped products. Finds highest-impact changes from data or feedback. | Shows how to chain audit + fix into one skill |
| `/ship` | Deployment with pre-flight checks, smoke-tests at 375px + 1440px, live URL verification. | Shows how to encode a deploy checklist as a skill |
| `/backtest` | Strategy validation — walk-forward (4+ folds), Monte Carlo, Deflated Sharpe. 22-check compliance gate. | Shows domain-specific skill with hard quality gates |
| `/autoforge` | Autonomous strategy optimization. Designs experiments, runs them, selects winners, iterates. | Shows a self-improving research loop as a skill |
| `/autoresearch` | ML experimentation using Karpathy's autoresearch framework. Hypothesis → experiment → analysis. | Shows scientific method encoded as a skill |
| `/intel` | Trade intelligence system — scan signals, regime analysis, trade alerts. | Shows a real-time data skill with external APIs |

Want to build your own? Start with [alirezarezvani/claude-code-skill-factory](https://github.com/alirezarezvani/claude-code-skill-factory) — it generates skill scaffolding from a description.
