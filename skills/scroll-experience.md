---
name: scroll-experience
description: Build cinematic scroll-driven storytelling experiences. Parallax, sticky sections, scroll-triggered animations, horizontal scrolling panels, and full-screen narratives. Uses Lenis (smooth scroll) + Framer Motion or GSAP ScrollTrigger. All animations respect prefers-reduced-motion. Use for landing pages, portfolio pieces, product showcases, and interactive storytelling.
---

# /scroll-experience — Cinematic Scroll Storytelling

Build experiences where scrolling IS the interaction.

## Usage

```
/scroll-experience [description]
```

Examples:
- `/scroll-experience a product reveal with sticky text + parallax images`
- `/scroll-experience a timeline that animates as you scroll through history`
- `/scroll-experience a horizontal scrolling portfolio gallery`
- `/scroll-experience a full-screen hero with text that splits apart on scroll`

## Stack

| Library | Purpose |
|---------|---------|
| **Lenis** | Smooth, physics-based scrolling |
| **Framer Motion** | React-native scroll animations |
| **GSAP + ScrollTrigger** | Complex timeline-based scroll choreography |

For React projects → Framer Motion.
For vanilla/complex timelines → GSAP + ScrollTrigger.

## Core Patterns

### Smooth Scroll Setup (Lenis)
```typescript
import Lenis from '@studio-freight/lenis'

const lenis = new Lenis({
  duration: 1.2,
  easing: (t) => Math.min(1, 1.001 - Math.pow(2, -10 * t)),
  smooth: true,
})

function raf(time: number) {
  lenis.raf(time)
  requestAnimationFrame(raf)
}
requestAnimationFrame(raf)
```

### Parallax Text (Framer Motion)
```typescript
import { useScroll, useTransform, motion } from 'framer-motion'

function ParallaxHero() {
  const { scrollYProgress } = useScroll()
  const y = useTransform(scrollYProgress, [0, 1], ['0%', '50%'])
  const opacity = useTransform(scrollYProgress, [0, 0.3], [1, 0])

  return (
    <motion.div style={{ y, opacity }}>
      <h1>Your Headline</h1>
    </motion.div>
  )
}
```

### Sticky Section with Progress
```typescript
function StickySection({ children }) {
  const ref = useRef(null)
  const { scrollYProgress } = useScroll({
    target: ref,
    offset: ['start start', 'end end']
  })

  return (
    <section ref={ref} style={{ height: '300vh' }}>
      <div style={{ position: 'sticky', top: 0, height: '100vh' }}>
        {children}
      </div>
    </section>
  )
}
```

### GSAP Timeline with ScrollTrigger
```javascript
gsap.timeline({
  scrollTrigger: {
    trigger: '.hero',
    start: 'top top',
    end: 'bottom top',
    scrub: 1, // smooth scrubbing
  }
})
.to('.headline', { y: -100, opacity: 0 })
.to('.background', { scale: 1.2 }, '<')
.from('.next-section', { opacity: 0, y: 60 })
```

## Reduced Motion (MANDATORY)

```typescript
import { useReducedMotion } from 'framer-motion'

function AnimatedSection() {
  const prefersReducedMotion = useReducedMotion()
  
  // Skip all animations if user prefers reduced motion
  const variants = prefersReducedMotion
    ? { hidden: {}, visible: {} }
    : { hidden: { opacity: 0, y: 60 }, visible: { opacity: 1, y: 0 } }

  return (
    <motion.div
      initial="hidden"
      whileInView="visible"
      variants={variants}
      transition={{ duration: 0.6 }}
    >
      {children}
    </motion.div>
  )
}
```

**Non-negotiable:** every animation must check `prefers-reduced-motion`. Vestibular disorders make motion-heavy sites unusable for ~35% of users with disabilities.

## Experience Types

### Parallax Landing Page
Multiple layers moving at different scroll speeds. Creates depth.
- Background: moves slowest (0.3× scroll speed)
- Midground: medium (0.6×)
- Foreground text: normal (1×)

### Sticky Reveal Story
Content is fixed. Scroll drives the narrative progression.
Each "chapter" reveals as user scrolls through tall sections.

### Horizontal Gallery
Vertical scroll translates to horizontal movement.
Great for portfolios, timelines, product comparisons.

### Number Counter
Statistics count up as they enter the viewport.
```typescript
const count = useMotionValue(0)
const rounded = useTransform(count, Math.round)
useEffect(() => {
  if (isInView) animate(count, targetNumber, { duration: 1.5 })
}, [isInView])
```

## Tips

- `scrub: true` = real-time scroll mapping. `scrub: 1` = 1-second lag for smoother feel.
- Test on mobile — touch scroll feels different than mouse wheel
- Lenis + Framer Motion: use Lenis for smooth scroll, Framer for animation logic
- Never use ScrollTrigger AND Lenis without connecting them (use Lenis's RAF callback)
