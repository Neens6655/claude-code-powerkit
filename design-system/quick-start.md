# ZGNAL Design System — Quick Start

Get a new project styled correctly in under 5 minutes.

## Step 1: Install Fonts

Add to your HTML `<head>` or CSS:

```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Mono:wght@400;600;700&family=IBM+Plex+Sans:wght@400;500;600&family=IBM+Plex+Serif:wght@400;600&display=swap" rel="stylesheet">
```

## Step 2: Import Tokens

Copy `tokens.css` to your project's styles directory, then import it:

```css
/* src/styles/globals.css */
@import './tokens.css';
```

Or in a Next.js project, import in `layout.tsx`:

```typescript
import '@/styles/globals.css'
```

## Step 3: Use Tokens

```html
<!-- Bauhaus Card -->
<div class="card">
  <span class="card-label">Monthly Revenue</span>
  <div class="card-value">$12,400</div>
</div>

<!-- Buttons -->
<button class="btn btn-primary">Get Started</button>
<button class="btn btn-secondary">Learn More</button>

<!-- Typography -->
<h1 style="font-family: var(--font-mono); font-weight: 700;">
  Product Name
</h1>
<p style="font-family: var(--font-sans);">
  Supporting description text.
</p>
```

## Step 4: Run `/design` for Components

Use the `/design` skill to generate any component:

```
/design a pricing page with 3 tiers
/design a hero section with headline and CTA
/design a data table with sorting
```

Claude will use the tokens automatically.

## Core Principles

| Principle | Rule |
|-----------|------|
| Border radius | Always 0 — no rounded corners |
| Borders | 2px solid, always |
| Typography | IBM Plex Mono for headings/labels, IBM Plex Sans for body |
| Color | Beige background, charcoal text, gold accent |
| Spacing | 8px grid — use multiples of 8 |
| Animations | Always respect `prefers-reduced-motion` |

## Color Reference

| Token | Hex | Use |
|-------|-----|-----|
| `--color-bg` | `#F5F0E8` | Page background |
| `--color-surface` | `#FFFFFF` | Cards, panels |
| `--color-text` | `#2B2B2B` | Body text |
| `--color-text-muted` | `#7A7A7A` | Secondary text, labels |
| `--color-accent` | `#C8933F` | Gold highlights |
| `--color-danger` | `#C44536` | Errors, destructive actions |
| `--border-color` | `#0A0A0A` | All borders |

## Tailwind v4 Integration

The `@theme {}` block in `tokens.css` registers tokens as Tailwind utilities:

```html
<!-- These work as Tailwind classes: -->
<div class="bg-beige text-charcoal border-2 border-black font-mono">
<span class="text-gold uppercase tracking-widest">
<button class="shadow-hard hover:shadow-none">
```

## Common Mistakes

| Mistake | Fix |
|---------|-----|
| Adding `border-radius` | Remove it — 0 radius always |
| Using any font other than IBM Plex | Always IBM Plex |
| Mixing design styles | Pick one style per project |
| Gold on beige | Contrast fails WCAG — use `--color-gold-dark` on beige |
| Forgetting `prefers-reduced-motion` | Add to every CSS animation |

## What `/design` Generates

Run `/design` to get ready-to-use component code styled with these tokens:

```
/design a navigation header with logo and 4 links
/design a 3-column feature grid
/design a testimonial section with 3 cards
/design a footer with links and copyright
```

All output uses CSS tokens from this file. Paste and done.
