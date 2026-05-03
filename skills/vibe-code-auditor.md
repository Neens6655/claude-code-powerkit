---
name: vibe-code-auditor
description: Comprehensive code quality audit for projects built with AI assistance. Checks for the specific failure modes of AI-generated code: security holes left open, unused files, inconsistent patterns, missing error handling, placeholder text left in, and technical debt that accumulated silently. Run before shipping any AI-assisted build.
---

# /vibe-code-auditor — AI-Assisted Code Quality Gate

AI-generated code has predictable failure modes. This skill finds them before your users do.

## Usage

```
/vibe-code-auditor
/vibe-code-auditor [specific area: security|ux|performance|cleanup]
```

## The 8 Failure Modes of AI Code

### 1. Security Holes Left Open
AI often skips security in the first draft:
- [ ] No input validation on API endpoints
- [ ] API keys hardcoded in source files
- [ ] No rate limiting on auth endpoints
- [ ] SQL queries built with string concatenation (injection risk)
- [ ] `CORS: *` in production
- [ ] Passwords stored in plaintext or with weak hashing
- [ ] JWT tokens never validated
- [ ] File uploads without type validation

### 2. Placeholder Text in Production
- [ ] "TODO: implement this"
- [ ] "Lorem ipsum" copy
- [ ] "Your Name Here" or "Company Name"
- [ ] Example API keys (e.g., `sk-123456789`)
- [ ] Test email addresses in real code paths

### 3. Zombie Files
- [ ] Components built but never imported
- [ ] API routes that nothing calls
- [ ] Utilities written but unused
- [ ] Old versions of files kept as `_old` or `_backup`
- [ ] Test files for deleted features

### 4. Missing Error States
- [ ] API calls with no error handling (`fetch` without try/catch)
- [ ] Loading states exist but error states don't
- [ ] Database errors not caught → 500s exposed to users
- [ ] No fallback when third-party service is down

### 5. Inconsistent Patterns
AI forgets its own earlier decisions:
- [ ] 3 different ways to do the same thing in the same codebase
- [ ] Mixed async patterns (`async/await` + `.then()` + callbacks)
- [ ] Some components typed, others not
- [ ] CSS modules in some files, Tailwind in others

### 6. Performance Time Bombs
- [ ] No pagination on lists (works with 10 items, fails with 10,000)
- [ ] Images not optimized or lazy-loaded
- [ ] `useEffect` dependencies missing (infinite loops waiting to happen)
- [ ] Unindexed database columns on frequently queried fields
- [ ] `console.log` statements left in hot paths

### 7. Missing Accessibility
- [ ] Images without `alt` text
- [ ] Buttons without accessible labels
- [ ] Form inputs without labels
- [ ] Color contrast below WCAG AA (4.5:1)
- [ ] No keyboard navigation on interactive elements

### 8. Environment Config Debt
- [ ] `.env.example` missing or outdated
- [ ] Environment variables used in code but not documented
- [ ] Production + development URLs hardcoded

## Audit Report Format

```
VIBE CODE AUDIT — [Project] — [Date]

SECURITY          ██████████ 7/10  ⚠️
COMPLETENESS      ████████░░ 8/10  ✅
CONSISTENCY       ██████░░░░ 6/10  ⚠️
PERFORMANCE       █████████░ 9/10  ✅
ACCESSIBILITY     ███████░░░ 7/10  ⚠️

CRITICAL (fix before ship):
  SEC-01: API keys in .env.local committed to git [src/.env.local:3]
  SEC-02: No input validation on /api/signup [src/app/api/signup/route.ts:12]

HIGH (fix this week):
  CNS-01: 3 different data-fetching patterns in use — standardize on React Query
  UX-01: No error state on contact form submit failure

MEDIUM (fix before v2):
  ACC-01: 6 images missing alt text
  PERF-01: Product list loads all records — add pagination

LOW (nice to have):
  CLN-01: 3 zombie components (never imported)
  CLN-02: 14 console.log statements in production code
```

## After the Audit

- Use `/fix` for each Critical and High issue
- Use `/iterate` for Medium issues
- Use `/feedback-loop` to save patterns that keep coming up

## Tips

- Run this audit before every deploy, not just before launch
- Critical issues with ⚠️ SECURITY are non-negotiable — ship with zero Critical security issues
- The Consistency issues are the hardest to catch without an audit — they don't cause errors, they cause maintainability debt
