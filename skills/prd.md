---
name: prd
description: Interactive product requirements interview. Ask when requirements are unclear, the scope is fuzzy, or you want to align before building. Conducts a structured 5-question interview, then produces a complete PRD (Product Requirements Document) with user stories, success metrics, and scope boundaries. Use before /kickoff or /autopilot on any non-trivial project.
---

# /prd — Product Requirements Interview

Turn a fuzzy idea into a clear spec before a single line of code is written.

## Usage

```
/prd [topic or idea]
```

Examples:
- `/prd I want to build a habit tracker`
- `/prd our app needs a search feature`
- `/prd redesign the user onboarding flow`

## Interview Process

Plato conducts a structured interview — 5-7 questions, one at a time. Never a wall of questions. Each answer informs the next question.

### Core Questions (always asked)
1. **Who is this for?** — "Describe the person using this. What do they do? What's their pain today?"
2. **What's the single most important thing it does?** — "If a user could only do one thing with this, what is it?"
3. **What does success look like?** — "How do you know in 3 months that this worked?"
4. **What's explicitly out of scope?** — "What are you NOT building in v1?"
5. **What are the hard constraints?** — "Timeline, budget, tech stack, existing systems to integrate with?"

### Follow-up Questions (as needed)
- Edge cases: "What happens when [X fails]?"
- Scale: "How many users in month 1 vs month 12?"
- Existing alternatives: "What do users do today without this?"

## Output: PRD Document

After the interview, produces a structured PRD:

```markdown
# PRD: [Product Name]

## Problem Statement
[One paragraph — who has this problem, why it matters, current workaround]

## Target User
[Persona description — role, goals, frustrations]

## Core Use Cases
1. [Primary flow — happy path]
2. [Secondary flow]
3. [Edge case]

## User Stories
- As a [user], I want to [action] so that [outcome]
- ...

## Success Metrics
| Metric | Target | How to Measure |
|--------|--------|----------------|
| [metric] | [target] | [measurement] |

## Scope: v1
### In Scope
- [feature]
- [feature]

### Explicitly Out of Scope
- [feature]
- [feature]

## Constraints
- [constraint]

## Open Questions
- [question]
```

## After the PRD

Offer to:
- Run `/architect` to design the technical implementation
- Run `/kickoff` to build with approval gates
- Run `/autopilot` to build hands-off

## Tips

- The PRD catches scope creep BEFORE it happens
- "Out of scope" is as important as "in scope"
- Success metrics prevent the "is it done?" debate later
- Run `/prd` whenever you disagree on what to build next
