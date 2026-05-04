---
name: design
description: Apply the ZGNAL Design System to any UI. Generates component code, CSS tokens, and layout decisions in a specific visual style. 7 style modes: bauhaus (default), editorial, brutalist, agency, glass, dark, custom. Use before building any frontend, or to redesign existing components. Produces pixel-ready code with IBM Plex typography, precise spacing, and WCAG AA accessible colors.
---

# /design — Built-in Design System

Apply a consistent, professional visual system to any UI component or page.

> **What is ZGNAL?** It's the built-in design system — consistent fonts, colors, and layout rules so your projects look professional out of the box. No setup or configuration needed. Just run `/design` and it applies automatically.

## Usage

```
/design [style?] [component or page]
```

Examples:
- `/design a pricing page` — Bauhaus default
- `/design editorial a blog post page`
- `/design glass a dashboard sidebar`
- `/design dark a settings panel`
- `/design brutalist a portfolio homepage`
- `/design --tokens` — output the full CSS token set

## Style Modes

### Bauhaus (default)
```
Palette: Beige #F5F0E8, Charcoal #2B2B2B, Black #0A0A0A, White #FFFFFF
Accent: Gold #C8933F, Red #C44536
Typography: IBM Plex Mono 600 headings, IBM Plex Sans 400 body
Borders: 2px solid, 0 border-radius
Spacing: 8px base grid, generous whitespace
Feel: Geometric, institutional, timeless
```

### Editorial
```
Palette: White #FFFFFF, Near-black #1A1A1A, Accent: Deep blue #1B2C6B
Typography: IBM Plex Serif body, IBM Plex Mono labels
Borders: 1px solid #E0E0E0
Feel: Magazine, sophisticated, content-first
```

### Brutalist
```
Palette: White, Black, raw primary colors (red, yellow, blue)
Typography: IBM Plex Mono everywhere, oversized, misaligned intentionally
Borders: 4px solid black, heavy shadows
Feel: Raw, anti-design, confrontational
```

### Agency
```
Palette: Cream #FAF7F2, Navy #0D1B2A, Gold #E8A020
Typography: IBM Plex Sans Bold headings, IBM Plex Sans body
Borders: 1px solid, subtle
Feel: Premium consultancy, clean, trustworthy
```

### Glass
```
Palette: Dark base #0F0F1A, Translucent cards (backdrop-blur)
Typography: IBM Plex Sans, light weight
Borders: 1px solid rgba(255,255,255,0.1)
Feel: Modern SaaS, dashboard-forward
```

### Dark
```
Palette: Background #0A0A0A, Surface #141414, Border #2A2A2A
Typography: IBM Plex Mono labels, IBM Plex Sans body
Accents: Gold or Electric blue
Feel: Developer tool, terminal aesthetic
```

## What /design Produces

For each request, outputs:
1. **Component code** — ready-to-paste React + Tailwind
2. **CSS tokens** — design variables for the chosen style
3. **Spacing and layout** — specific margin/padding values
4. **Typography scale** — font sizes, weights, line heights
5. **Color usage guide** — which tokens for which semantic roles

## WCAG Compliance

All styles are WCAG AA compliant by default:
- Text contrast ≥ 4.5:1
- Interactive elements ≥ 3:1
- Never recommends colors known to fail (e.g., gold on white)

## Tokens Output

```
/design --tokens
```

Produces the full CSS custom property set:
```css
:root {
  /* Typography */
  --ds-font-mono: 'IBM Plex Mono', monospace;
  --ds-font-sans: 'IBM Plex Sans', sans-serif;
  
  /* Colors */
  --ds-bg: #F5F0E8;
  --ds-surface: #FFFFFF;
  --ds-text: #2B2B2B;
  --ds-border: #2B2B2B;
  --ds-accent: #C8933F;
  
  /* Spacing */
  --ds-space-1: 8px;
  --ds-space-2: 16px;
  --ds-space-3: 24px;
  --ds-space-4: 32px;
  --ds-space-6: 48px;
  --ds-space-8: 64px;
  
  /* Borders */
  --ds-border-width: 2px;
  --ds-border-radius: 0;
}
```

## Tips

- Bauhaus is the default — use it when in doubt. It works everywhere.
- Never mix styles in one project
- Run `/design --tokens` first, paste into your CSS, then build components
- All animations must respect `prefers-reduced-motion`
