---
name: beautiful-prose
description: Write and edit long-form content — blog posts, landing page copy, documentation, emails, essays. Produces publication-quality writing with clear structure, active voice, and a consistent tone. Use when you need words that actually get read. Accepts a topic, draft, or URL and returns polished prose.
---

# /beautiful-prose — Publication-Quality Writing

Write content that people actually finish reading.

## Usage

```
/beautiful-prose [topic or draft]
```

Examples:
- `/beautiful-prose write a blog post about why TypeScript is worth the friction`
- `/beautiful-prose edit this landing page copy` (then paste copy)
- `/beautiful-prose write onboarding email for new signups`
- `/beautiful-prose write docs for the authentication module`

## What It Produces

### Blog Posts
- Hook opening (first line earns the second line)
- Clear argument structure
- Concrete examples, not abstractions
- Scannable with headers + pull quotes
- Strong closing with a clear takeaway

### Landing Page Copy
- Headline: benefit-first, not feature-first
- Subheadline: addresses the primary objection
- Body: problem → solution → proof → call to action
- Microcopy: button labels, tooltips, empty states

### Technical Documentation
- Overview: what this does and why you'd use it
- Quick start: running example in under 5 minutes
- Reference: complete, accurate, no assumptions
- Examples: real scenarios, not toy ones

### Emails
- Subject: specific, honest, no clickbait
- Opening: get to the point in the first sentence
- Body: one idea per email
- CTA: one action, clear, low friction

## Tone Modes

Default: **Clear Professional** — confident, direct, no fluff, no jargon.

Other modes:
- `--conversational` — warmer, first-person, like talking to a friend
- `--formal` — corporate, third-person, appropriate for legal/finance
- `--playful` — humor welcome, punchy sentences, pop culture OK
- `--technical` — precision over accessibility, terms assumed

## Prose Rules (Always Applied)

**Cut:**
- Filler words: "very", "really", "basically", "essentially", "just"
- Hedge phrases: "it could be argued that", "in my opinion"
- Passive voice where active works
- Redundant pairs: "each and every", "first and foremost"

**Add:**
- Specific numbers over vague claims ("40% faster" not "much faster")
- Concrete examples for every abstract claim
- Strong verbs over weak verb + adverb ("sprinted" not "ran quickly")
- White space — short paragraphs, breathing room

## Editing Mode

Paste your draft after the command. Output includes:
- Tracked changes (what changed and why)
- Grade: Clarity / Concision / Persuasion / Flow (each 1-10)
- 3 specific improvement suggestions

## Tips

- Good copy starts with a clear reader: "who am I writing for, and what do they want?"
- The headline is 80% of the work. Write 10, keep the best one.
- Technical accuracy and clear prose are not in conflict — be both.
