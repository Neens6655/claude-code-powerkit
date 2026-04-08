# Skills Catalog

35+ Claude Code skills organized by what they do.

## How to Install Skills

Skills are markdown files. Copy them to `~/.claude/skills/[skill-name]/SKILL.md`:

```bash
# Example: install beautiful-prose from GitHub
git clone https://github.com/SHADOWPR0/beautiful_prose.git /tmp/beautiful_prose
mkdir -p ~/.claude/skills/beautiful-prose
cp /tmp/beautiful_prose/SKILL.md ~/.claude/skills/beautiful-prose/SKILL.md

# Now use it: just type /beautiful-prose in any Claude session
```

For skills from large collections (like alirezarezvani/claude-skills), clone the repo and copy the individual SKILL.md files you want.

> **Note**: Skills marked "Available in collections" can be found in the mega-repos listed in [REPOS.md](REPOS.md). Skills marked "Author's custom" are from the kit author's private setup and are not publicly installable — they're listed here so you know what's possible and can build your own versions.

---

## First Day Gotchas

Before installing skills, know these two things:
1. **MCP tools are deferred** — Claude doesn't load MCP tool schemas until it needs them. If a tool isn't working, ask Claude to "load the Playwright tools" or similar.
2. **Files over 2,000 lines get silently truncated** — Claude's Read tool caps at 2k lines. For large files, ask Claude to read in chunks.

---

## Planning & Architecture
| Skill | What it does | Install from |
|-------|-------------|-------------|
| `/prd` | Product requirements interview | Available in collections |
| `/architect` | Architecture-first planning with file maps | Available in collections |
| `/kickoff` | End-to-end build pipeline with approval gates | Available in collections |
| `/app-builder` | Full-stack app from natural language | Available in collections |

## Code Quality
| Skill | What it does | Install from |
|-------|-------------|-------------|
| `/verification-before-completion` | Forces verify before claiming "done" | [obra/superpowers](https://github.com/obra/superpowers) |
| `/lint-and-validate` | Auto linting + static analysis | Available in collections |
| `/vibe-code-auditor` | Audit AI-generated code for fragility | Available in collections |
| `/kaizen` | Continuous improvement + error proofing | Available in collections |
| `/output-skill` | Force complete code (no `// ...rest` placeholders) | Available in collections |

## Frontend & Design
| Skill | What it does | Install from |
|-------|-------------|-------------|
| `/react-best-practices` | 40+ React/Next.js perf rules (Vercel Engineering) | Available in collections |
| `/tailwind-patterns` | Tailwind v4 CSS-first config | Available in collections |
| `/typescript-expert` | TypeScript strict patterns | Available in collections |
| `/scroll-experience` | Parallax, Lenis, GSAP ScrollTrigger | [vibeship-spawner-skills](https://github.com/vibeforge1111/vibeship-spawner-skills) |
| `/algorithmic-art` | p5.js generative art | Available in collections |
| `/shader-programming-glsl` | WebGL vertex/fragment shaders | Available in collections |
| `/canvas-design` | Static visual art (PNG/PDF) | Available in collections |
| `/remotion-best-practices` | React-based video/motion graphics | Available in collections |
| `/web-artifacts-builder` | Complex multi-component React artifacts | Available in collections |
| `/stitch-skill` | Google Stitch design system | Available in collections |

## Content & Media
| Skill | What it does | Install from |
|-------|-------------|-------------|
| `/baoyu-image-gen` | Multi-provider image generation | baoyu collection (search GitHub) |
| `/baoyu-infographic` | 20 layouts x 17 visual styles | baoyu collection |
| `/baoyu-slide-deck` | Presentation/PPT generation | baoyu collection |
| `/beautiful-prose` | Hard-edged writing (kills AI voice) | [SHADOWPR0/beautiful_prose](https://github.com/SHADOWPR0/beautiful_prose) |
| `/data-storytelling` | Data narratives for stakeholders | Available in collections |
| `/claude-d3js-skill` | D3.js interactive data viz | Available in collections |

## Building Skills, Agents & MCP Servers
| Skill | What it does | Install from |
|-------|-------------|-------------|
| `/claude-api` | Build apps with Claude API / Agent SDK | Built-in plugin (enable in settings) |
| `/agent-sdk-dev` | Create Claude Agent SDK applications | Built-in plugin (enable in settings) |
| `/mcp-builder` | Build MCP servers for Claude | Available in collections |
| `/claude-code-setup` | Analyze codebase, recommend automations | Built-in plugin (enable in settings) |
| `/claude-md-management` | Audit and improve CLAUDE.md files | Built-in plugin (enable in settings) |
| Skill Factory | Generate your own skills at scale | [alirezarezvani/claude-code-skill-factory](https://github.com/alirezarezvani/claude-code-skill-factory) |

## Workflow & Automation
| Skill | What it does | Install from |
|-------|-------------|-------------|
| `/dispatching-parallel-agents` | Run 2+ tasks in parallel | [obra/superpowers](https://github.com/obra/superpowers) |
| `/subagent-driven-development` | Spec-driven implementation | [obra/superpowers](https://github.com/obra/superpowers) |
| `/behavioral-modes` | brainstorm/implement/debug/review/ship | Available in collections |
| `/hierarchical-agent-memory` | Scoped memory, reduces token spend | [kromahlusenii-ops/ham](https://github.com/kromahlusenii-ops/ham) |
| `/loki-mode` | 100+ agent autonomous system | Available in collections |
| `/multi-agent-brainstorming` | Multi-perspective design review | Available in collections |
| `/autopilot` | Brief-to-deployment pipeline | Author's custom |
| `/iterate` | Improve shipped product | Author's custom |
| `/ship` | Deploy + pre-flight + smoke test | Author's custom |

## Bonus: SaaS & Business
| Skill | What it does | Install from |
|-------|-------------|-------------|
| `/micro-saas-launcher` | Indie hacker SaaS playbook | [vibeship-spawner-skills](https://github.com/vibeforge1111/vibeship-spawner-skills) |
| `/viral-generator-builder` | Shareable tools (quizzes, generators) | [vibeship-spawner-skills](https://github.com/vibeforge1111/vibeship-spawner-skills) |
| `/marketing-psychology` | Behavioral science for marketing | Available in collections |
| `/voice-agents` | Voice AI agents | [vibeship-spawner-skills](https://github.com/vibeforge1111/vibeship-spawner-skills) |

---

## Priority Install Order (Top 10)

If you can only install 10 skills, start here:

| # | Skill | Why | Install |
|---|-------|-----|---------|
| 1 | `/react-best-practices` | 40+ Vercel perf rules | Collections |
| 2 | `/verification-before-completion` | Stop shipping broken code | [obra/superpowers](https://github.com/obra/superpowers) |
| 3 | `/beautiful-prose` | Kill AI slop in writing | [SHADOWPR0/beautiful_prose](https://github.com/SHADOWPR0/beautiful_prose) |
| 4 | `/tailwind-patterns` | Tailwind v4 the right way | Collections |
| 5 | `/typescript-expert` | Strict TS patterns | Collections |
| 6 | `/dispatching-parallel-agents` | 2x speed on multi-task work | [obra/superpowers](https://github.com/obra/superpowers) |
| 7 | `/mcp-builder` | Build your own tools | Collections |
| 8 | `/behavioral-modes` | brainstorm/implement/debug/ship | Collections |
| 9 | `/vibe-code-auditor` | Catch AI code fragility | Collections |
| 10 | `/hierarchical-agent-memory` | Reduce token spend | [kromahlusenii-ops/ham](https://github.com/kromahlusenii-ops/ham) |

> **"Collections"** = find these in [alirezarezvani/claude-skills](https://github.com/alirezarezvani/claude-skills), [VoltAgent/awesome-agent-skills](https://github.com/VoltAgent/awesome-agent-skills), or [anthropics/skills](https://github.com/anthropics/skills). Clone the repo, find the skill folder, copy its SKILL.md.
