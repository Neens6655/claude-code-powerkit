---
name: feedback-loop
description: Capture corrections so they never repeat. When Claude makes a mistake you correct, /feedback-loop saves the rule to a corrections file for that skill so future sessions respect it. Also use to review existing rules, remove stale ones, or see why Claude behaved a certain way. Usage: /feedback-loop [skill-name] [correction], /feedback-loop show [skill], /feedback-loop list.
---

# /feedback-loop — Correction Capture System

Tell it once. Claude remembers forever.

## Usage

```
/feedback-loop [skill] [what went wrong and the correct behavior]
/feedback-loop show [skill]
/feedback-loop list
/feedback-loop remove [skill] [rule number]
```

Examples:
- `/feedback-loop autopilot never use port 3000 — always scan for a free port`
- `/feedback-loop design stop using border-radius — Bauhaus means 0 radius`
- `/feedback-loop show fix`
- `/feedback-loop list`

## How It Works

1. You give Claude a correction during or after a task
2. `/feedback-loop` extracts the rule and writes it to `~/.claude/skills/[skill]/corrections/[rule].md`
3. Future sessions with that skill load corrections at startup
4. Corrections have HIGHER PRIORITY than the skill's default behavior

## Correction File Format

Each correction is saved as:

```markdown
---
rule: [short name for the rule]
skill: [which skill this applies to]
priority: high
added: YYYY-MM-DD
---

## Rule
[The specific behavioral rule — what to DO or NOT DO]

## Why
[The reason — what went wrong, what the consequence was]

## When to Apply
[The trigger conditions — "whenever doing X", "always", "when Y is present"]
```

## Viewing Corrections

```
/feedback-loop show autopilot
```

Outputs:
```
Corrections for /autopilot (3 rules):

1. port-scan-first (2025-01-15)
   Never use port 3000/3001/4000 — always scan for a free port first.
   Why: User had another process on 3000, server silently failed.

2. screenshot-before-done (2025-01-20)
   Always take Playwright screenshots before reporting "done".
   Why: Visual bugs missed in 2 consecutive sessions.

3. tailwind-v4-config (2025-02-01)
   Never create tailwind.config.js — use @theme{} in CSS.
   Why: v4 breaking change, kept reverting to v3 patterns.
```

## Global vs Skill Corrections

| Scope | Location | Applies To |
|-------|----------|-----------|
| Skill-specific | `~/.claude/skills/[skill]/corrections/` | Only that skill |
| Global | `~/.claude/CLAUDE.md` | All sessions |

For corrections that apply everywhere (not just one skill), add them to CLAUDE.md directly.

## When to Use

- After any correction: "no not that", "don't do X", "stop doing Y"
- After a confirmed approach: "yes exactly, keep doing that"
- After discovering a project-specific rule ("this project uses X not Y")
- Weekly review: `/feedback-loop list` to clean up stale rules

## Tips

- Corrections compound — each one makes the whole system better
- Be specific: "use Supabase not local SQLite in this project" is better than "use the right database"
- Remove stale rules — a wrong rule is worse than no rule
- The most valuable corrections are the non-obvious ones (obvious things Claude already does right)
