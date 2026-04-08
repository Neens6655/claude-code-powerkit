# Pro Tips

Lessons from 200+ hours of production Claude Code usage.

---

## 1. Quality Loop That Actually Works

```
Build something
  -> /eval (deterministic check)
  -> Fix issues
  -> /feedback-loop (capture rule)
  -> Next build is better
```

This is the #1 thing that separates a good setup from a great one. Every correction becomes a permanent rule.

## 2. Never Ship Without Screenshots

Code-level audits miss rendering bugs. Every. Single. Time.

What Playwright screenshots catch that code review doesn't:
- Invisible cards (white text on white background)
- Broken fonts (fallback sans-serif instead of your font)
- Dark-on-dark contrast failures
- Stuck CSS animations
- Missing mobile nav at 375px
- Overlapping elements on small screens

**Rule**: Take screenshots at 1440px (desktop) + 375px (mobile) before every deploy.

## 3. Use Behavioral Modes

Tell Claude what mode you're in for dramatically different behavior:

| Mode | What Claude does |
|------|-----------------|
| "brainstorm mode" | Divergent thinking, no code, explores options |
| "implement mode" | Focused coding, minimal discussion |
| "debug mode" | Traces root cause, doesn't guess |
| "review mode" | Finds issues, doesn't fix yet |
| "ship mode" | Deploy checklist, smoke tests, verification |

## 4. Parallel Agents = 2x Speed

When you have 2+ independent tasks, don't do them sequentially:

> "Run these in parallel: build the header component AND set up the API route"

Or use `/dispatching-parallel-agents` for structured parallel work.

## 5. Protect Yourself from AI Slop

Install these two skills immediately:
- `/beautiful-prose` — kills the generic, over-explained AI writing style
- `/vibe-code-auditor` — catches fragile, over-abstracted AI code patterns

## 6. Memory Saves Context Across Sessions

Claude Code has auto-memory at `~/.claude/projects/[project]/memory/`. Teach it things:

```
"Remember: we use bun, never npm"
"Remember: the API is at /api/v2, not /api"
"Remember: dark mode uses --color-bg-dark token"
"Remember: the Stripe webhook secret is in STRIPE_WEBHOOK_SECRET env var"
```

These persist across sessions so you don't repeat yourself.

## 7. MCP Tools Are Deferred

MCP tool schemas aren't loaded into context until you request them. If Claude says it can't find an MCP tool, tell it:

> "Use ToolSearch to load the Playwright tools first"

This saves context tokens when you're not using those tools.

## 8. Model Routing Saves Money

When using subagents (Agent tool), pick the right model tier:

| Task | Model | Why |
|------|-------|-----|
| Architecture, security audit | `opus` | Needs deep reasoning |
| Implementation, code review | `sonnet` | Good enough, 5x cheaper |
| Grep, lint, format, tests | `haiku` | Mechanical work, 25x cheaper |

## 9. Large Files Get Silently Truncated

The Read tool caps at 2,000 lines without warning. For large files:

```
1. Run: wc -l <file>
2. Read in chunks: offset=0 limit=2000, then offset=2000 limit=2000, etc.
```

## 10. Hooks Are Your Safety Net

The settings.json in this kit includes hooks that:
- **Block npm/yarn** — forces bun (consistency)
- **Run tests before deploy** — catches broken code before production
- **Flag frontend changes** — reminds you to verify the build
- **Quality gate on stop** — reminds you to screenshot before ending

Add your own hooks for project-specific guardrails.

## 11. Don't Start from Scratch

Before writing code, always ask Claude:
> "Search the codebase for existing implementations of X"

Claude tends to create new code when perfectly good code already exists. Force it to look first.

## 12. The Skill Routing Cheat Sheet

| What you want | Skill to use |
|---------------|-------------|
| Plan a project | `/architect` |
| Write requirements | `/prd` |
| Build end-to-end | `/kickoff` or `/autopilot` |
| Deploy | `/ship` |
| Improve after launch | `/iterate` |
| Review/audit | `/plato` |
| Fix a bug | `/fix` |
| Explain code | `/explain` |
| Build an MCP server | `/mcp-builder` |
| Build an agent | `/claude-api` or `/agent-sdk-dev` |
| Generate skills | Skill Factory repo |
