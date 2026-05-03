---
name: architect
description: Technical architecture planning before writing code. Reads the PRD or idea, proposes stack choices with tradeoffs, designs the file structure and data model, identifies risks, and produces a step-by-step implementation plan. Use before /kickoff or /autopilot on anything non-trivial. Prevents the "wrong foundation" problem.
---

# /architect — Technical Architecture Planner

Design the foundation before pouring concrete. Architect produces the implementation blueprint before a single file is created.

## Usage

```
/architect [idea or path to PRD]
```

Examples:
- `/architect design a job board SaaS`
- `/architect docs/prd.md`
- `/architect add real-time notifications to our chat app`

## What Architect Produces

### 1. Stack Recommendation

Compares 2-3 options with explicit tradeoffs:

```
Option A: Next.js + Supabase
  Pros: built-in auth, real-time, generous free tier
  Cons: vendor lock-in, SQL mental model needed
  Best if: you want to ship in a weekend

Option B: Vite + Express + PostgreSQL
  Pros: full control, portable, easier to self-host
  Cons: more setup, more maintenance
  Best if: you need fine-grained control

Recommendation: Option A — matches your constraints (solo builder, ship fast, limited DB experience)
```

### 2. File Structure

```
src/
  app/           # pages/routes
  components/    # reusable UI
    ui/          # primitive components
    features/    # domain-specific components
  lib/           # business logic (no UI dependencies)
  hooks/         # React hooks
  types/         # TypeScript types
  styles/        # global CSS
```

### 3. Data Model

```
User { id, email, name, created_at }
Post { id, title, content, author_id → User, published_at }
Tag  { id, name }
PostTag { post_id → Post, tag_id → Tag }
```

### 4. Key Design Decisions

For each non-obvious choice:
```
Decision: Local state vs. server state for cart
Options: useState / Zustand / React Query + API
Chosen: React Query — cart persists across refreshes, consistent with our "no lost data" principle
```

### 5. Implementation Plan

Ordered list of buildable chunks, each delivering value independently:

```
1. Auth (login/signup) — nothing else works without this
2. Core data model + CRUD API — foundation for all features
3. Main UI shell + navigation — skeleton users can click through
4. Feature A — primary use case
5. Feature B — secondary use case
6. Polish + error states — production readiness
```

### 6. Risks

| Risk | Likelihood | Mitigation |
|------|------------|------------|
| Real-time complexity | Medium | Prototype with polling first, upgrade to WS later |
| Third-party API rate limits | High | Cache aggressively, add retry logic |

## Output

Architect produces `ARCHITECTURE.md` in the project root. This file becomes the source of truth for `/kickoff` and `/autopilot`.

## After Architecture

- **Build with gates**: `/kickoff` (reads ARCHITECTURE.md automatically)
- **Build hands-off**: `/autopilot` (reads ARCHITECTURE.md automatically)
- **Audit the plan**: `/plato technical`

## Tips

- "Architect first" prevents the 3x rewrite. One hour of planning saves a week of refactoring.
- Architect is opinionated — it picks one stack and explains why. If you disagree, say so.
- Run `/architect` again when scope changes significantly (major new feature, different scale target)
