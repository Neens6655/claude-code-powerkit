---
name: canvas-design
description: Generate static visual compositions using HTML Canvas or SVG — charts, infographics, diagrams, logos, geometric art, data visualizations. No external libraries unless specified. Produces self-contained HTML files that render in any browser. Use for one-off visuals, data graphics, brand assets, or programmatic art.
---

# /canvas-design — Static Visual Generation

Generate precise visual compositions as self-contained HTML files.

## Usage

```
/canvas-design [description of visual]
```

Examples:
- `/canvas-design a bar chart showing monthly revenue for 2024`
- `/canvas-design a geometric logo mark — circle inside a square, IBM Plex Mono wordmark below`
- `/canvas-design an infographic: 5-step process flow, Bauhaus style`
- `/canvas-design a network diagram showing 6 connected nodes`

## Output

Every `/canvas-design` output is:
- A self-contained `output.html` file
- Opens in any browser
- No dependencies, no network requests
- Copy-paste ready for use

## When to Use Canvas vs SVG

| Use Canvas | Use SVG |
|------------|---------|
| Pixel manipulation, photos | Scalable icons, logos |
| Complex animations | Static diagrams |
| Many elements (1000+) | Text-heavy graphics |
| Game-like interactions | Print-ready graphics |

## Style System

By default, all `/canvas-design` outputs use the ZGNAL Bauhaus system:

```javascript
const ZGNAL = {
  colors: {
    beige: '#F5F0E8',
    charcoal: '#2B2B2B',
    black: '#0A0A0A',
    white: '#FFFFFF',
    gold: '#C8933F',
    red: '#C44536',
  },
  fonts: {
    mono: '\'IBM Plex Mono\', monospace',
    sans: '\'IBM Plex Sans\', sans-serif',
  },
  borders: {
    width: 2,
    style: 'solid',
    color: '#2B2B2B',
  },
}
```

Override with `--style [editorial|dark|colorful]`.

## Output Types

### Charts (Canvas)
Bar charts, line charts, scatter plots, area charts.
Data provided inline or as a JSON array.

### Infographics (SVG)
Process flows, comparison tables, icon + text layouts, timelines.

### Geometric Art (Canvas)
Parametric patterns, generative compositions, logo marks.

### Diagrams (SVG)
Flowcharts, architecture diagrams, network graphs, entity-relationship diagrams.

## Example: Bar Chart

```javascript
// /canvas-design monthly revenue bar chart
// Data: Jan 12k, Feb 18k, Mar 15k, Apr 22k, May 28k, Jun 31k

const data = [
  { month: 'Jan', value: 12000 },
  { month: 'Feb', value: 18000 },
  // ...
]

// Outputs a 800×500 canvas with:
// - Bauhaus beige background
// - Black bars with 2px borders
// - IBM Plex Mono axis labels
// - Gold highlight on highest bar
// - Title in IBM Plex Mono 600
```

## Tips

- SVG for anything that needs to scale (logos, icons, diagrams)
- Canvas for pixel work or large datasets (charts with 1000+ data points)
- Always load IBM Plex fonts from Google Fonts in the HTML file
- Self-contained = no external images — encode everything as base64 or draw programmatically
