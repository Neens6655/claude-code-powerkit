# API Rules

- All env vars validated at startup (Zod or manual guard)
- Every endpoint returns proper error responses (not raw exceptions)
- All async routes need error boundaries
- Key endpoints must return 200 before deploy
- CORS configured for allowed origins only
- Rate limiting on public endpoints
