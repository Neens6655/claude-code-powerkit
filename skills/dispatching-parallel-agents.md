---
name: dispatching-parallel-agents
description: Splits any task into independent subtasks and runs them in parallel using multiple subagents. Use when the work naturally partitions into non-dependent pieces — e.g., "build these 4 pages", "research these 5 topics", "refactor these 3 components". Returns a summary of all agent results when complete.
---

# /dispatching-parallel-agents — Parallel Subagent Orchestrator

Split work across multiple specialist agents running simultaneously. 3× to 5× faster than sequential execution for tasks that can be parallelized.

## When to Use

- Building multiple independent features simultaneously
- Researching several topics at once
- Running tests or audits across different modules
- Generating multiple variants (content, designs, configs)
- Reviewing files in parallel

**Not for:** tasks with dependencies (A must finish before B starts).

## Workflow

### Step 1: Decompose

Break the request into independent chunks. Ask:
- Can chunk B start without chunk A's output?
- Do the chunks share no mutable state?
- Are the chunks roughly equal in effort?

If yes to all → fully parallel. If some dependencies exist → hybrid (parallel groups, sequential between groups).

### Step 2: Dispatch

Spawn agents in a single message with multiple `Agent(...)` calls.

```
Agent 1: [task 1 — self-contained spec]
Agent 2: [task 2 — self-contained spec]
Agent 3: [task 3 — self-contained spec]
```

Each agent prompt must be **self-contained** — include file paths, context, and expected output. The agent has no memory of the conversation.

### Step 3: Collect + Integrate

When all agents complete:
1. Review each result
2. Identify conflicts or overlaps
3. Integrate into a coherent whole
4. Report summary to user

## Prompt Template for Each Agent

```
Context: [1-2 sentences about the project]
Task: [specific, bounded work item]
Files to read: [paths]
Output: [what to produce — file write, analysis, code change]
Constraints: [style guide, no new deps, etc.]
```

## Example: Build 3 Pages Simultaneously

```
/dispatching-parallel-agents build the About, Pricing, and Contact pages for this Next.js app
```

Decomposes to:
- Agent 1: Build `src/app/about/page.tsx` — read existing Home page for style reference
- Agent 2: Build `src/app/pricing/page.tsx` — use the pricing tiers in `docs/pricing.md`
- Agent 3: Build `src/app/contact/page.tsx` — wire to the contact form handler in `src/lib/contact.ts`

All three run simultaneously. You get all three pages in the time it takes to build one.

## Agent Types Available

| Agent | Best For |
|-------|----------|
| `Explore` | File search, codebase navigation |
| `general-purpose` | Research, multi-step tasks |
| `Plan` | Architecture planning |
| `code-simplifier` | Refactoring and cleanup |
| `frontend-auditor` | Visual QA and accessibility |

## Tips

- Each agent starts cold — make prompts self-contained
- Parallel agents don't communicate during execution
- For conflicts: resolve manually after all agents complete
- Use `model: "haiku"` for mechanical agents (grep, lint, screenshot) to save quota
- 4–6 parallel agents is the sweet spot — beyond that, results pile up faster than you can integrate them
