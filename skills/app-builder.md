---
name: app-builder
description: Specialized builder for web apps and micro-SaaS products. Takes a description and builds a complete, production-ready web application with auth, data persistence, and a polished UI. Opinionated stack: Next.js 15 + Tailwind v4 + Supabase (auth + database) + TypeScript strict. Use for: dashboards, tools, SaaS apps, admin panels, any product with user accounts.
---

# /app-builder — Web App Builder

Build complete web applications — auth, database, UI, all included.

## Usage

```
/app-builder [description]
```

Examples:
- `/app-builder a project tracking tool with team workspaces`
- `/app-builder a recipe manager with shopping list export`
- `/app-builder a link shortener with click analytics`

## Stack (Fixed)

| Layer | Technology |
|-------|------------|
| Framework | Next.js 15 (App Router) |
| Styling | Tailwind v4 |
| Language | TypeScript (strict) |
| Auth | Supabase Auth (email + OAuth) |
| Database | Supabase (PostgreSQL) |
| Deployment | Vercel |
| Testing | Vitest |

## What Gets Built

### Authentication
- Sign up / login / logout
- Password reset
- Google OAuth (optional)
- Protected routes
- Session management

### Database
- Schema based on your requirements
- Row Level Security (RLS) so users only see their own data
- Migrations

### UI
- Landing page
- Auth pages (login, signup)
- Main app layout with navigation
- Core feature pages
- Empty states, loading states, error states

### API
- Server Actions (Next.js 15)
- Input validation
- Error handling

## Output Structure

```
src/
  app/
    (auth)/           # login, signup, reset
    (app)/            # protected app pages
      layout.tsx      # app shell
      dashboard/
      [feature]/
  components/
    ui/               # buttons, inputs, cards
    [feature]/        # domain components
  lib/
    supabase/         # client, server, middleware
    [feature]/        # business logic
  types/
supabase/
  migrations/         # database schema
```

## Quality Checklist

Before reporting done:
- [ ] Auth flow works end-to-end (signup → login → protected page)
- [ ] Core feature CRUD works
- [ ] RLS prevents data leakage between users
- [ ] Build exits 0
- [ ] Playwright screenshots at 1440px + 375px
- [ ] Mobile navigation works
- [ ] Empty/loading/error states all handled

## Environment Variables Needed

```env
NEXT_PUBLIC_SUPABASE_URL=
NEXT_PUBLIC_SUPABASE_ANON_KEY=
SUPABASE_SERVICE_ROLE_KEY=
```

Create a free Supabase project at supabase.com.

## After Building

- `/iterate` — polish and improve
- `/plato full` — pre-launch audit
- `/ship` — deploy to production
