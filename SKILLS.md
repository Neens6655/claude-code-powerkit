# Skills Catalog

Top 35+ Claude Code skills, organized by what they do.

## How to Install Skills

```bash
# From a local SKILL.md file
claude skill add /path/to/SKILL.md

# From a cloned repo
git clone https://github.com/some-user/skill-repo.git
claude skill add skill-repo/SKILL.md
```

---

## Planning & Architecture
| Skill | What it does | Source |
|-------|-------------|--------|
| `/prd` | Product requirements interview — asks questions, outputs structured PRD | Community |
| `/architect` | Architecture-first planning with file maps | Community |
| `/kickoff` | End-to-end build pipeline with approval gates | Community |
| `/app-builder` | Full-stack app from natural language | Community |

## Code Quality
| Skill | What it does | Source |
|-------|-------------|--------|
| `/verification-before-completion` | Forces you to verify before claiming "done" | [obra/superpowers](https://github.com/obra/superpowers) |
| `/lint-and-validate` | Auto linting + static analysis after every change | Community |
| `/vibe-code-auditor` | Audit AI-generated code for fragility | Community |
| `/kaizen` | Continuous improvement + error proofing | Community |
| `/output-skill` | Force complete code output (no `// ...rest` placeholders) | Community |

## Frontend & Design
| Skill | What it does | Source |
|-------|-------------|--------|
| `/react-best-practices` | 40+ React/Next.js perf rules from Vercel Engineering | Community |
| `/tailwind-patterns` | Tailwind v4 CSS-first config, container queries | Community |
| `/typescript-expert` | TypeScript strict patterns | Community |
| `/scroll-experience` | Parallax, Lenis, GSAP ScrollTrigger | [vibeship-spawner-skills](https://github.com/vibeforge1111/vibeship-spawner-skills) |
| `/algorithmic-art` | p5.js generative art with seeded randomness | Community |
| `/shader-programming-glsl` | WebGL vertex/fragment shaders | Community |
| `/canvas-design` | Static visual art (PNG/PDF) | Community |
| `/remotion-best-practices` | React-based video/motion graphics | Community |
| `/web-artifacts-builder` | Complex multi-component React artifacts | Community |
| `/stitch-skill` | Google Stitch design system generation | Community |

## Content & Media
| Skill | What it does | Source |
|-------|-------------|--------|
| `/baoyu-image-gen` | Multi-provider image generation (OpenAI, Google, DashScope) | baoyu |
| `/baoyu-infographic` | 20 layouts x 17 visual styles | baoyu |
| `/baoyu-slide-deck` | Presentation/PPT generation | baoyu |
| `/beautiful-prose` | Hard-edged writing (kills AI voice) | [SHADOWPR0/beautiful_prose](https://github.com/SHADOWPR0/beautiful_prose) |
| `/data-storytelling` | Data narratives for stakeholders | Community |
| `/claude-d3js-skill` | D3.js interactive data viz | Community |

## Building Skills, Agents & MCP Servers
| Skill | What it does | Source |
|-------|-------------|--------|
| `/claude-api` | Build apps with Claude API / Anthropic SDK / Agent SDK | Plugin |
| `/agent-sdk-dev` | Create and verify Claude Agent SDK applications | Plugin |
| `/mcp-builder` | Build MCP servers that connect Claude to external services | Community |
| `/claude-code-setup` | Analyze codebase, recommend automations (hooks, skills, MCP) | Plugin |
| `/claude-md-management` | Audit and improve CLAUDE.md files across repos | Plugin |
| Skill Factory | Generate your own skills at scale | [alirezarezvani/claude-code-skill-factory](https://github.com/alirezarezvani/claude-code-skill-factory) |

## Workflow & Automation
| Skill | What it does | Source |
|-------|-------------|--------|
| `/dispatching-parallel-agents` | Run 2+ independent tasks in parallel | [obra/superpowers](https://github.com/obra/superpowers) |
| `/subagent-driven-development` | Spec-driven implementation with subagents | [obra/superpowers](https://github.com/obra/superpowers) |
| `/behavioral-modes` | Switch modes: brainstorm, implement, debug, review, ship | Community |
| `/hierarchical-agent-memory` | Scoped CLAUDE.md memory, reduces token spend | [kromahlusenii-ops/ham](https://github.com/kromahlusenii-ops/ham) |
| `/loki-mode` | 100+ agent autonomous startup system | Community |
| `/multi-agent-brainstorming` | Structured multi-perspective design review | Community |
| `/autopilot` | Brief-to-deployment — zero manual gates, full pipeline | Community |
| `/iterate` | Improve shipped product based on feedback/audit | Community |
| `/ship` | Deploy with pre-flight checks + Playwright smoke test | Community |

## Bonus: SaaS & Business
| Skill | What it does | Source |
|-------|-------------|--------|
| `/micro-saas-launcher` | Indie hacker SaaS playbook — validation, MVP, pricing, launch | [vibeship-spawner-skills](https://github.com/vibeforge1111/vibeship-spawner-skills) |
| `/viral-generator-builder` | Build shareable tools (quizzes, generators, calculators) | [vibeship-spawner-skills](https://github.com/vibeforge1111/vibeship-spawner-skills) |
| `/marketing-psychology` | Behavioral science for marketing decisions | Community |
| `/startup-financial-modeling` | Financial models for startups | Community |
| `/voice-agents` | Build voice AI agents (speech + natural conversation) | [vibeship-spawner-skills](https://github.com/vibeforge1111/vibeship-spawner-skills) |

---

## Priority Install Order

If you can only install 10 skills, install these first:

1. `/react-best-practices` — Vercel's 40+ perf rules
2. `/tailwind-patterns` — Tailwind v4 the right way
3. `/typescript-expert` — strict TS patterns
4. `/verification-before-completion` — stop shipping broken code
5. `/beautiful-prose` — kill AI slop in writing
6. `/mcp-builder` — build your own tools
7. `/architect` — plan before you code
8. `/dispatching-parallel-agents` — 2x speed on multi-task work
9. `/vibe-code-auditor` — catch AI code fragility
10. `/behavioral-modes` — brainstorm/implement/debug/review/ship
