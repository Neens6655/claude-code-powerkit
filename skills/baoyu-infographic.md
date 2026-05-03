---
name: baoyu-infographic
description: Generate structured infographics from data, lists, or concepts. Outputs a self-contained HTML/CSS infographic — process diagrams, comparison tables, stat showcases, how-it-works explainers, timelines. All styled with the ZGNAL Bauhaus system. Use when you have information that's clearer as a visual than as text.
---

# /baoyu-infographic — Structured Infographic Generator

Turn data and concepts into visual stories.

## Usage

```
/baoyu-infographic [type] [content or description]
```

Examples:
- `/baoyu-infographic stats our Q1 metrics: 1,240 users, $8,400 MRR, 4.2% churn, NPS 67`
- `/baoyu-infographic process explain how our AI pipeline works in 5 steps`
- `/baoyu-infographic comparison: our product vs Competitor A vs Competitor B`
- `/baoyu-infographic timeline history of the internet 1990-2025`

## Infographic Types

### Stats Showcase
Large numbers, minimal decoration, maximum impact.
```
→ 3-6 key metrics displayed as large numerals
→ Label below in small caps
→ Optional: sparkline trend indicator
→ Grid layout: 2 or 3 per row
```

### Process Flow
Step-by-step visual explanation.
```
→ Numbered circles connected by arrows
→ Icon or emoji per step
→ Short title + 1-sentence description
→ Horizontal (5 or fewer steps) or vertical (any length)
```

### Comparison Table
Side-by-side feature comparison.
```
→ Features as rows, options as columns
→ ✓ / ✗ / custom values per cell
→ Highlight column: "Best for you"
→ Automatic winner callout
```

### Timeline
Chronological narrative.
```
→ Horizontal or vertical layout
→ Year/date marker + event title + 1-sentence description
→ Visual accent on milestones
```

### How It Works
Architecture or system explainer.
```
→ Boxes connected by labeled arrows
→ Data flow direction indicated
→ Color coding for system layers
```

## Output

Always produces a self-contained `infographic.html` file:
- Opens in any browser
- Print-ready (A4 or landscape)
- Copy-paste HTML snippet for embedding in pages
- IBM Plex fonts loaded from Google Fonts CDN

## Design System

All infographics use ZGNAL Bauhaus by default:

```
Background: #F5F0E8 (beige)
Text: #2B2B2B (charcoal)
Borders: 2px solid #0A0A0A
Accent: #C8933F (gold) for highlights
Numbers: IBM Plex Mono 700
Labels: IBM Plex Mono 400, uppercase, 0.1em letter-spacing
Body: IBM Plex Sans 400
```

Override: `--style dark` for dark background, `--style editorial` for magazine style.

## Quality Rules

Every infographic must:
- [ ] Communicate the key insight without any explanatory text needed
- [ ] Work in grayscale (color is enhancement, not dependency)
- [ ] Be readable at half size (thumbnail test)
- [ ] Have one dominant visual element that draws the eye first

## Tips

- Start with the insight, then design around it: "What's the one thing someone should take away?"
- Numbers should be the largest element in a stats infographic
- Process diagrams: 5-7 steps maximum. More → split into two infographics
- Comparison tables: 3 options maximum. More → filter to most relevant
- Always include a title — infographics shared without context need their own headline
