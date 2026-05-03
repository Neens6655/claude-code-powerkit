# CLAUDE.md

> This is a template. Customize the sections marked CUSTOMIZE to match your project.

## Stack — CUSTOMIZE

- **Frontend**: React 19 + Tailwind v4 + TypeScript (strict mode)
- **Package manager**: bun (or npm — your choice)
- **Framework**: Next.js 15 (SSR/content) or Vite (SPAs)
- **Testing**: Vitest (frontend), pytest (Python)
- **API**: Hono (bridges) or FastAPI (Python-native)

## Design System — CUSTOMIZE

Activate `/design` for any UI work. Defaults to ZGNAL Design System:
- Fonts: IBM Plex Mono (primary), IBM Plex Sans (secondary)
- Aesthetic: Bauhaus — 0 border-radius, 2px solid borders, geometric
- 300+ CSS variables in `design-system/tokens.css`

## Code Conventions

### TypeScript
- `"strict": true` always
- `"moduleResolution": "bundler"`
- No barrel imports (`index.ts` re-exports)
- Prefer Server Components in Next.js

### Tailwind v4
- Use `@theme {}` in CSS for config (not `tailwind.config.js`)
- Prefer utility classes over custom CSS
- Use CSS variables for design tokens

## Quality Gates (Universal — Keep These)

### Before Every Deploy
1. Build passes locally (`bun run build` exits 0)
2. All tests pass
3. Playwright screenshots at 1440px (desktop) + 375px (mobile)
4. No console errors in browser
5. Core user action completes end-to-end

### Large File Reading Guard
Files over 2,000 lines get silently truncated by the Read tool. Always:
1. Check line count first: `wc -l <file>`
2. Use `offset` and `limit` params to read in chunks

## Model Routing (for subagents)

| Task | Model |
|------|-------|
| Architecture, security audit, final verdicts | opus |
| Implementation, code review, pattern compliance | sonnet |
| Grep, lint, format, tests, file lookup | haiku |

## Learning Mode

Run `/sensei` before every code task. Teaches the concept, asks a prediction, waits for answer.
Kill switch: add `#noteach` to any prompt to skip.
