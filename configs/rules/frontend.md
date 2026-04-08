# Frontend Rules

- Tailwind v4 with `@theme {}` in CSS — never tailwind.config.js
- IBM Plex Mono primary, IBM Plex Sans secondary — or customize to your brand
- React 19, Server Components preferred, no barrel imports
- TypeScript strict mode always
- Error boundaries on every async route
- `prefers-reduced-motion` on all animations
- NEVER ship without Playwright screenshots at 1440px + 375px
- Mobile nav must exist — test at 375px before shipping
- Use bun as package manager, never yarn
