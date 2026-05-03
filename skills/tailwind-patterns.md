---
name: tailwind-patterns
description: Tailwind v4 patterns, gotchas, and best practices. Covers the v4 migration (no tailwind.config.js, @theme{} in CSS), responsive design patterns, component recipes, and common mistakes. Use when working with Tailwind v4, debugging unexpected styles, or building reusable component systems.
---

# /tailwind-patterns — Tailwind v4 Patterns

Master Tailwind v4 — the breaking changes, the new patterns, and the component recipes.

## Usage

```
/tailwind-patterns [topic]
```

Examples:
- `/tailwind-patterns how does @theme work in v4`
- `/tailwind-patterns responsive grid with 1-2-3 column layout`
- `/tailwind-patterns how to create a custom color`
- `/tailwind-patterns` — full v4 orientation

## Tailwind v4: The Key Changes

### Configuration Moved to CSS
```css
/* v4: tailwind.config.js is GONE. All config lives here: */
@import "tailwindcss";

@theme {
  --color-brand: #C8933F;
  --color-surface: #F5F0E8;
  --font-mono: 'IBM Plex Mono', monospace;
  --font-sans: 'IBM Plex Sans', sans-serif;
  --radius: 0;  /* 0 = Bauhaus no border-radius */
  --spacing-18: 72px;  /* custom spacing token */
}
```

### Using Custom Tokens as Classes
```html
<!-- Your @theme tokens become utility classes automatically -->
<div class="bg-brand text-surface font-mono">
```

### Arbitrary Values Still Work
```html
<div class="grid-cols-[1fr_2fr_1fr]">
<div class="mt-[37px]">
```

## Common Patterns

### Responsive Grid
```html
<!-- 1 col mobile, 2 col tablet, 3 col desktop -->
<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
```

### Centered Layout with Max Width
```html
<main class="mx-auto w-full max-w-5xl px-4 sm:px-6 lg:px-8">
```

### Sticky Header
```html
<header class="sticky top-0 z-50 border-b-2 border-black bg-surface">
```

### Card Component (Bauhaus)
```html
<div class="border-2 border-black p-6 bg-white">
  <h3 class="font-mono text-sm uppercase tracking-widest text-zinc-500">Label</h3>
  <p class="mt-2 font-mono text-2xl font-bold">Value</p>
</div>
```

### Button Variants
```html
<!-- Primary -->
<button class="border-2 border-black bg-black px-6 py-3 font-mono text-sm text-white hover:bg-zinc-800">
  Primary
</button>

<!-- Secondary -->
<button class="border-2 border-black bg-transparent px-6 py-3 font-mono text-sm text-black hover:bg-black hover:text-white">
  Secondary
</button>
```

### Dark Mode
```css
/* v4 dark mode */
@variant dark (&:where(.dark, .dark *));
```

```html
<div class="bg-white dark:bg-zinc-900 text-black dark:text-white">
```

## Animations (with reduced-motion)
```css
@media (prefers-reduced-motion: no-preference) {
  .fade-in {
    animation: fadeIn 200ms ease-out;
  }
}

@keyframes fadeIn {
  from { opacity: 0; transform: translateY(-4px); }
  to   { opacity: 1; transform: translateY(0); }
}
```

## Common Mistakes

| Mistake | Fix |
|---------|-----|
| Using `tailwind.config.js` in v4 | Move all config to `@theme {}` in CSS |
| `bg-[#fff]` instead of token | Define in `@theme`, use `bg-surface` |
| Missing `@import "tailwindcss"` | Add to main CSS file |
| `border-radius` in design system | Set `--radius: 0` in `@theme` |
| Inline styles for design tokens | Always CSS variables + Tailwind classes |

## The 5 Classes You'll Always Use

```
flex items-center justify-between   → horizontal layout, space between
grid grid-cols-[auto,1fr] gap-4     → label + content grid
border-2 border-black               → Bauhaus borders
font-mono text-sm uppercase tracking-widest  → Bauhaus labels
transition-colors duration-150      → hover state transitions
```

## Tips

- Tailwind v4 is CSS-first. Think in CSS, write in CSS, the utility classes are shorthand.
- `@theme` tokens are CSS custom properties AND utility classes. `--color-brand` → `text-brand`, `bg-brand`, `border-brand`.
- Run `npx tailwindcss --input src/styles.css --output dist/styles.css --watch` to see exactly what CSS is generated.
