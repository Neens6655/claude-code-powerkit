---
name: react-best-practices
description: React 19 + Next.js 15 performance, patterns, and correctness audit. Reviews components for common mistakes: unnecessary re-renders, useEffect misuse, missing keys, state that should be derived, server vs client component decisions. Use when a React app is slow, buggy, or hard to maintain. Also use proactively when building new components.
---

# /react-best-practices — React 19 Patterns & Performance

Write React that's fast, correct, and maintainable.

## Usage

```
/react-best-practices [file or component name]
```

Examples:
- `/react-best-practices src/components/ProductList.tsx`
- `/react-best-practices the user profile page`
- `/react-best-practices` — audit the whole project

## What Gets Checked

### 1. Server vs Client Components
- `"use client"` should be pushed as far down the tree as possible
- Data fetching belongs in Server Components
- Event handlers require Client Components
- Interactivity requires Client Components

**Common mistake:** marking a whole page `"use client"` when only one button needs it.

### 2. useEffect Misuse
```typescript
// BAD: deriving state in useEffect
useEffect(() => {
  setFullName(`${firstName} ${lastName}`)
}, [firstName, lastName])

// GOOD: derive during render
const fullName = `${firstName} ${lastName}`
```

**When useEffect is correct:** syncing with external systems (analytics, DOM APIs, subscriptions). Not for transforming props/state.

### 3. Unnecessary Re-renders
- `useMemo` for expensive computations
- `useCallback` for stable function references passed to optimized children
- `React.memo` for pure components with stable props
- Move state down — don't lift state higher than necessary

### 4. Keys in Lists
```typescript
// BAD: index as key (breaks on reorder)
items.map((item, i) => <Item key={i} {...item} />)

// GOOD: stable unique ID
items.map(item => <Item key={item.id} {...item} />)
```

### 5. Data Fetching Patterns
```typescript
// Next.js 15 — fetch in Server Component
async function ProductPage({ id }: { id: string }) {
  const product = await db.products.find(id) // runs on server
  return <ProductView product={product} />
}
```

### 6. TypeScript Strictness
- No `any` — use `unknown` and narrow
- Explicit return types on all exported functions
- Props interfaces over inline types for reusable components
- `as const` for literal arrays and objects

### 7. Error Boundaries
- Every async route needs an `error.tsx` in Next.js
- Wrap third-party integrations in try/catch
- Never let unhandled promise rejections crash the page

## Common Anti-Patterns Caught

| Anti-Pattern | Fix |
|---|---|
| `useEffect` for derived state | Compute during render |
| Fetching in `useEffect` | Move to Server Component or React Query |
| Prop drilling 3+ levels | React Context or state management |
| Large component files (500+ lines) | Split by concern |
| `console.log` left in code | Remove before shipping |
| Hardcoded strings | Move to constants or i18n |

## Performance Audit Output

For each issue found:
```
⚠️ PERFORMANCE: ProductList re-renders on every parent update
File: src/components/ProductList.tsx:23
Issue: Component receives unstable `onSelect` callback
Fix: Wrap with useCallback in parent, or memo ProductList
Impact: Medium — visible lag with 100+ products
```

## Tips

- Server Components are the default in Next.js 15. Add `"use client"` only when you need it.
- `useEffect` with an empty deps array `[]` runs once. `useEffect` with no deps array runs every render. These are different.
- The React DevTools Profiler shows exactly which components are re-rendering and why.
