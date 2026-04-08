# CLAUDE.md

> This is a template. Customize the sections marked CUSTOMIZE to match your project.

## Stack — CUSTOMIZE

- **Frontend**: React 19 + Tailwind v4 + TypeScript (strict mode)
- **Package manager**: bun (or npm — your choice)
- **Framework**: Next.js 15 (SSR/content) or Vite (SPAs)
- **Testing**: Vitest (frontend), pytest (Python)
- **API**: Hono (bridges) or FastAPI (Python-native)

## Code Conventions

### TypeScript
- `"strict": true` always
- `"moduleResolution": "bundler"`
- No barrel imports (`index.ts` re-exports)
- Prefer Server Components in Next.js

### Tailwind v4
- Use `@theme {}` in CSS for config (not tailwind.config.js)
- Prefer utility classes over custom CSS
- Use CSS variables for design tokens

### Fonts — CUSTOMIZE
- Primary: your choice (e.g., Inter, IBM Plex Mono, JetBrains Mono)
- Secondary: your choice
- Load via Google Fonts or self-host

## Quality Gates (Universal — Keep These)

### Before Every Deploy
1. Build passes locally (`bun run build` or `npm run build` exits 0)
2. All tests pass
3. Playwright screenshots taken at 1440px (desktop) + 375px (mobile)
4. No console errors in browser
5. Core user action completes end-to-end

### Visual Inspection (MANDATORY for Frontend)
NEVER ship a frontend without Playwright screenshots. Code audits miss rendering bugs.
1. Start dev server
2. Take full-page screenshots at 1440px and 375px
3. Scroll section-by-section, screenshot each viewport
4. Check console for font/JS errors
5. Fix visual bugs BEFORE deploying

### Large File Reading Guard
Files over 2,000 lines get silently truncated by the Read tool. Always:
1. Run `wc -l <file>` first
2. Use `offset` and `limit` params to read in chunks
3. Continue until entire file is read

## Model Routing (for subagents)

When spawning subagents via the Agent tool, use the right model tier:

| Task | Model |
|------|-------|
| Architecture, security audit, final verdicts | opus |
| Implementation, code review, pattern compliance | sonnet |
| Grep, lint, format, tests, file lookup | haiku |
