# Pro Tips

Lessons from 200+ hours of production Claude Code usage.

---

## First Day Gotchas

### 1. Large Files Get Silently Truncated
The Read tool caps at 2,000 lines without warning. For large files:
```
1. Ask Claude: "how many lines is this file?"
2. Read in chunks: offset=0 limit=2000, then offset=2000, etc.
```

### 2. MCP Tools Are Deferred
MCP tool schemas aren't loaded until Claude needs them. If Claude says it can't find an MCP tool, just ask:
> "Load the Playwright tools" or "search for the Brave search tool"

Claude will load the schema and the tool will work.

### 3. Never Ship Without Screenshots
Code-level audits miss rendering bugs. Every. Single. Time.

What Playwright screenshots catch that code review doesn't:
- Invisible cards (white text on white background)
- Broken fonts (fallback sans-serif instead of your font)
- Dark-on-dark contrast failures
- Stuck CSS animations
- Missing mobile nav at 375px

**Rule**: Take screenshots at 1440px (desktop) + 375px (mobile) before every deploy.

---

## When You're Ready to Level Up

### 4. Use Behavioral Modes
Tell Claude what mode you're in:

| Mode | What Claude does |
|------|-----------------|
| "brainstorm mode" | Divergent thinking, no code |
| "implement mode" | Focused coding, minimal discussion |
| "debug mode" | Traces root cause, doesn't guess |
| "review mode" | Finds issues, doesn't fix yet |
| "ship mode" | Deploy checklist, smoke tests |

### 5. Quality Loop That Actually Works
```
Build something
  -> test it (bun test, Playwright screenshot)
  -> fix issues
  -> tell Claude "remember: don't do X again"
  -> next build is better
```

### 6. Parallel Agents = 2x Speed
When you have 2+ independent tasks:
> "Run these in parallel: build the header component AND set up the API route"

Or use `/dispatching-parallel-agents` for structured parallel work.

### 7. Protect Yourself from AI Slop
Install these two skills:
- `/beautiful-prose` — kills generic AI writing style
- `/vibe-code-auditor` — catches fragile AI code patterns

### 8. Memory Saves Context Across Sessions
Claude Code has auto-memory at `~/.claude/projects/[project]/memory/`. Teach it:
- "Remember: we use bun, never npm"
- "Remember: the API is at /api/v2, not /api"
- "Remember: dark mode uses --color-bg-dark token"

### 9. Model Routing Saves Money
When using subagents (Agent tool), pick the right tier:

| Task | Model | Cost |
|------|-------|------|
| Architecture, security audit | `opus` | Full price |
| Implementation, code review | `sonnet` | ~5x cheaper |
| Grep, lint, format, tests | `haiku` | ~25x cheaper |

### 10. Hooks Are Your Safety Net
The settings.json in this kit includes hooks that:
- **Block npm/yarn** — forces bun for consistency
- **Flag frontend changes** — reminds to verify the build
- **Quality gate on stop** — reminds to screenshot before ending

### 11. Don't Start from Scratch
Before writing code, always ask:
> "Search the codebase for existing implementations of X"

Claude tends to create new code when good code already exists.

### 12. The Skill Routing Cheat Sheet

| What you want | Skill |
|---------------|-------|
| Plan a project | `/architect` |
| Write requirements | `/prd` |
| Build end-to-end | `/kickoff` |
| Fix a bug | `/fix` |
| Explain code | `/explain` |
| Build an MCP server | `/mcp-builder` |
| Build an agent | `/claude-api` or `/agent-sdk-dev` |
| Generate skills | Skill Factory repo |
