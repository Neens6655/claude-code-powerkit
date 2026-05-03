---
name: iterate
description: Post-ship product improvement loop. Audits what exists, prioritizes issues by user impact, proposes a roadmap of improvements, and implements them one by one with measurable outcomes. Use on products that are live but need polish, performance, or new features. Audit-first — never touches code without first understanding what exists.
---

# /iterate — Post-Ship Improvement Loop

Your product shipped. Now make it better, systematically.

## Usage

```
/iterate [product or focus area]
```

Examples:
- `/iterate` — full audit and prioritized improvements
- `/iterate performance` — focus on speed and bundle size
- `/iterate ux` — focus on user experience and flows
- `/iterate [feature name]` — iterate on a specific feature

## Workflow

### Step 1: Audit (read-only)

Before touching anything, understand what exists:
- Read key files (routes, components, API handlers)
- Run `/plato design` for visual issues
- Check build output and bundle size
- Identify error states and edge cases not handled
- Look for accessibility issues

### Step 2: Issue Registry

Document everything found, ranked by user impact:

```
P0 — Broken (users can't complete core action)
P1 — Painful (users struggle but get through)
P2 — Annoying (small friction, users work around it)
P3 — Polish (nice to have, professional touch)
```

### Step 3: Roadmap

Propose 3-5 improvements in priority order:

```
Sprint Plan:
1. [P0] Fix: checkout button unresponsive on mobile Safari — 30 min
2. [P1] Fix: loading state missing on form submit — 20 min
3. [P1] Improve: empty state for search with no results — 45 min
4. [P2] Add: keyboard shortcut for primary action — 30 min
5. [P3] Polish: transition animation on page change — 20 min

Total: ~2.5 hours
APPROVE? Or reprioritize?
```

**Waits for approval before writing any code.**

### Step 4: Execute

Implements improvements one by one:
- One fix at a time
- Screenshot after each visual change
- Build check after each code change
- Reports: ✅ Fixed / ⚠️ Partial / ❌ Blocked

### Step 5: Measure

For each improvement, states the measurable outcome:
- "Loading state added — users now see feedback within 100ms of submit"
- "Mobile fix applied — checkout works on Safari 17+"

## Iterate vs. Other Skills

| Situation | Use |
|-----------|-----|
| Product shipped, needs polish | `/iterate` |
| Specific bug to fix | `/fix` |
| New feature from scratch | `/kickoff` |
| Full architecture review | `/plato technical` |
| Mid-build quality improvement | work in progress — no audit needed |

## Tips

- Never iterate without auditing first — fixes without context create new bugs
- P0 issues block everything — fix before P1
- Each iteration sprint should take 2-4 hours max
- Re-run `/plato` after 3+ iteration sprints to check for drift
