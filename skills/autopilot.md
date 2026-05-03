---
name: autopilot
description: Fully autonomous "build and ship" mode for complete products. Takes a one-line idea and produces a deployed, tested, screenshotted product with zero gates. Use when you want hands-off execution of a well-defined build. Chains PRD → Architecture → Design → Code → Test → Screenshot → Deploy automatically.
---

# /autopilot — Autonomous Build Mode

Hand off a one-line idea. Get back a running, tested, deployed product.

## Usage

```
/autopilot [idea]
```

Examples:
- `/autopilot a todo app with local storage and drag-to-reorder`
- `/autopilot a landing page for my SaaS with waitlist signup`
- `/autopilot a markdown editor that previews in real time`

## What Autopilot Does

Runs 8 phases autonomously, no approval gates:

| Phase | Action |
|-------|--------|
| 1. Requirements | Extract requirements from your idea |
| 2. Architecture | Choose stack, file structure, data model |
| 3. Design | Apply design system (typography, tokens, spacing) |
| 4. Build | Write all code — components, logic, styles, routes |
| 5. Integrate | Wire up state, APIs, and external services |
| 6. Test | Run build, fix any errors |
| 7. Screenshot | Playwright screenshots at 1440px + 375px |
| 8. Deploy | Deploy to Vercel or local dev server |

## Stack Choices (auto-selected by project type)

| Type | Stack |
|------|-------|
| Web app / dashboard | Next.js 15 + Tailwind v4 + TypeScript |
| Landing page | Vite + React + Tailwind v4 |
| Static site | Vanilla HTML + CSS |
| API | Hono (Node) or FastAPI (Python) |

## Design System

All autopilot builds use the ZGNAL Design System by default:
- Fonts: IBM Plex Mono (primary), IBM Plex Sans (secondary)
- Palette: Beige / Charcoal / Black
- Aesthetic: Bauhaus — 0 border-radius, 2px solid borders
- Activate custom: `/autopilot --style [bauhaus|editorial|brutalist|glass] [idea]`

## Quality Gates (Non-Negotiable)

Before reporting done, autopilot ALWAYS:
1. Verifies `npm run build` (or equivalent) exits 0
2. Takes Playwright screenshots at desktop + mobile
3. Checks for console errors
4. Confirms the core user action works end-to-end

## Options

```
/autopilot --style editorial [idea]   # different visual style
/autopilot --no-deploy [idea]         # build only, don't deploy
/autopilot --api [idea]               # API-only, no frontend
```

## When NOT to Use Autopilot

- When you want approval gates between phases → use `/kickoff` instead
- When you need to start from requirements → use `/prd` → `/kickoff`
- When only fixing a bug → use `/fix`
- When auditing existing code → use `/plato`

## Output

When complete, autopilot reports:
- Live URL (or `localhost:[port]`)
- Screenshot paths
- File tree of what was built
- Any known limitations or follow-up suggestions
