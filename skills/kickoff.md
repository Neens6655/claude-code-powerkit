---
name: kickoff
description: Structured multi-phase build with human approval gates. Chains architecture → design → code → review at each major phase, waiting for your go-ahead before proceeding. Use when you want to stay in control of a complex build. Slower than /autopilot but safer for important projects.
---

# /kickoff — Structured Build with Approval Gates

Build complex features step by step, approving each phase before the next begins.

## Usage

```
/kickoff [idea or path to PRD/ARCHITECTURE.md]
```

Examples:
- `/kickoff user authentication system`
- `/kickoff docs/prd.md`
- `/kickoff docs/architecture.md`

## Phases

### Phase 1: Architecture (approval required)
- Reads PRD/idea
- Proposes stack, file structure, data model
- Lists all files that will be created or modified
- **Waits for your approval before proceeding**

### Phase 2: Design (approval required)
- Applies design system to all UI components
- Produces a component hierarchy
- Shows what the UI will look like (described, or wireframe if Playwright available)
- **Waits for your approval before proceeding**

### Phase 3: Implementation
- Writes all code in the approved structure
- Follows the design spec
- Runs build to verify no errors
- Does NOT stop for approval — builds the full thing

### Phase 4: Code Review
- Security check: OWASP top 10, auth flows, input validation
- Quality check: TypeScript types, error handling, edge cases
- Performance check: unnecessary re-renders, unindexed queries
- Reports issues as P0 (blocking) / P1 (should fix) / P2 (nice to have)

### Phase 5: Verify
- `npm run build` exits 0
- Playwright screenshots at 1440px + 375px
- Core user flow works end-to-end
- No console errors

## Approval Gate Format

After each approval-required phase:

```
PHASE [N] COMPLETE: [Phase Name]

Summary:
[3-5 bullet points of what was decided/built]

Files affected:
[list of files]

APPROVE? Type "yes" to continue to Phase [N+1], or tell me what to change.
```

## Kickoff vs Autopilot

| | Kickoff | Autopilot |
|--|---------|-----------|
| Approval gates | Yes (after each phase) | No (fully autonomous) |
| Best for | Important/complex builds | Quick/well-defined builds |
| Control | High | Low |
| Speed | Slower | Faster |
| Learning opportunity | High | Low |

## Tips

- Use Kickoff when the requirements aren't 100% clear
- The architecture approval gate is the most valuable — catch scope issues before writing code
- If Phase 4 finds P0 issues, Kickoff automatically fixes them before reporting done
- Add `--no-design` to skip Phase 2 (when reusing existing UI components)
