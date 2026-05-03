---
name: plato
description: Multi-advisor AI council that debates your idea, product, or code from 5 angles simultaneously, then delivers a single actionable verdict. Use for audits, pre-launch reviews, architecture decisions, and "roast my product" sessions. Run before shipping anything important. Modes: full (5 advisors, 5 phases), quick (3 advisors, fast), idea (early-stage concept), design (UI/UX focus), technical (architecture/code focus).
---

# /plato — AI Advisory Council

Five specialist advisors debate your product from every angle. One synthesis verdict.

## Usage

```
/plato [mode] [target]
```

Examples:
- `/plato full` — full 5-advisor audit of current project
- `/plato idea my SaaS concept` — early-stage concept stress-test
- `/plato design` — UI/UX focused audit
- `/plato technical` — architecture and code quality
- `/plato quick` — fast 3-advisor check in <2 minutes

## The 5 Advisors

| Advisor | Role | Their Question |
|---------|------|----------------|
| **Strategist** | Business & positioning | "Does this create real value? Who's the real target user?" |
| **Architect** | Technical decisions | "Is this the right stack? Where will it break at scale?" |
| **Designer** | UX & visual quality | "Would a user understand this in 5 seconds? Does it look professional?" |
| **Customer** | End-user advocate | "What frustrates a real user about this? What's missing?" |
| **Contrarian** | Devil's advocate | "What's the strongest argument against building this?" |

## Phases

### Phase 1: Reconnaissance (2-3 min)
Each advisor reads the relevant files. Strategist reads business context. Architect reads code. Designer reads UI. No opinions yet — just gathering.

### Phase 2: Individual Analysis (parallel)
All 5 advisors write independent assessments simultaneously. No groupthink.

### Phase 3: Discourse
Advisors respond to each other's points. Conflicts surface. Assumptions get challenged.

### Phase 4: Synthesis
One advisor (rotating) integrates the debate into a coherent picture.

### Phase 5: Verdict
```
VERDICT: [APPROVE / APPROVE WITH CONDITIONS / REVISE / REJECT]

Strengths:
- [3 bullet points]

Critical Issues:
- [P0: must fix before launch]
- [P1: fix before scale]

Recommended Next Steps:
1. [specific action]
2. [specific action]
3. [specific action]
```

## Modes

### `/plato full`
All 5 advisors, all 5 phases. Best for pre-launch, major features, or anything the team disagrees on. Takes 5-10 minutes.

### `/plato quick`
3 advisors (Strategist, Designer, Customer), no discourse phase. Fast check — best for "is this direction right?" questions. Takes <2 minutes.

### `/plato idea [concept]`
Early-stage concept audit. Strategist leads with "is this worth building?". Light on technical, heavy on market/user fit.

### `/plato design`
Designer leads. Focuses on: visual hierarchy, accessibility (WCAG AA), mobile responsiveness, user flows. Always takes Playwright screenshots.

### `/plato technical`
Architect leads. Focuses on: stack choices, performance, security (OWASP top 10), scalability, test coverage.

## Plato vs. Other Skills

| Situation | Use |
|-----------|-----|
| "Is this idea worth building?" | `/plato idea` |
| "Review my code" | `/plato technical` |
| "Does the UI look good?" | `/plato design` |
| "Are we ready to ship?" | `/plato full` |
| "Fix this specific bug" | `/fix` |
| "Build this feature" | `/autopilot` or `/kickoff` |

## Output Format

Plato always produces an HTML report saved to `plato-report-[date].html`. The report includes all advisor opinions, the discourse transcript, and the final verdict with action items.

## Tips

- Run Plato every 2 weeks on any active product
- "Roast my product" → `/plato full`
- "We're about to launch" → `/plato full` 48 hours before
- Plato finds what code reviews miss: user confusion, positioning gaps, mobile bugs
