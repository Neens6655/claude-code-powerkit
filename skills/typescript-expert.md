---
name: typescript-expert
description: TypeScript type system expert. Fixes type errors, explains complex type patterns, designs type-safe APIs, and catches runtime bugs before they happen. Use when you hit a TypeScript error you don't understand, want to design a type-safe data model, or need to understand generics/conditional types/utility types.
---

# /typescript-expert — TypeScript Type System

From beginner errors to advanced type patterns — get unstuck, fast.

## Usage

```
/typescript-expert [error or question]
```

Examples:
- `/typescript-expert Type 'string | undefined' is not assignable to type 'string'`
- `/typescript-expert how do I type a function that accepts any object shape`
- `/typescript-expert design a type-safe event emitter`
- `/typescript-expert what's the difference between type and interface`

## Common Errors Explained

### `Type 'X | undefined' is not assignable to type 'X'`
**What it means:** You have a value that might not exist, and you're trying to use it somewhere that requires it to exist.

```typescript
// BAD
function getUser(id: string): User {
  return users.find(u => u.id === id) // returns User | undefined
}

// FIX 1: Handle undefined
function getUser(id: string): User | undefined {
  return users.find(u => u.id === id)
}

// FIX 2: Throw if not found
function getUser(id: string): User {
  const user = users.find(u => u.id === id)
  if (!user) throw new Error(`User ${id} not found`)
  return user
}
```

### `Property 'X' does not exist on type 'Y'`
Usually means: you're accessing a property that TypeScript doesn't know about.

```typescript
// BAD: TypeScript doesn't know response has .data
const data = response.data

// FIX: Type the response
interface ApiResponse {
  data: Product[]
  total: number
}
const response: ApiResponse = await fetch('/api/products').then(r => r.json())
```

### `Argument of type 'X' is not assignable to parameter of type 'Y'`
Shape mismatch — the object you're passing doesn't match what the function expects.

## Patterns

### Discriminated Unions (type-safe state machines)
```typescript
type State =
  | { status: 'idle' }
  | { status: 'loading' }
  | { status: 'success'; data: User }
  | { status: 'error'; message: string }

// TypeScript narrows automatically
if (state.status === 'success') {
  console.log(state.data) // ✅ TypeScript knows .data exists here
}
```

### Generic Functions
```typescript
// Instead of: any
function first(arr: any[]): any { return arr[0] }

// Type-safe generic:
function first<T>(arr: T[]): T | undefined { return arr[0] }

const num = first([1, 2, 3])  // TypeScript infers: number | undefined
const str = first(['a', 'b']) // TypeScript infers: string | undefined
```

### Utility Types Cheat Sheet
```typescript
Partial<User>          // all fields optional
Required<Config>       // all fields required
Pick<User, 'id'|'name'>// only id and name
Omit<User, 'password'> // everything except password
Record<string, number> // { [key: string]: number }
ReturnType<typeof fn>  // return type of a function
Parameters<typeof fn>  // parameter types as tuple
```

### Zod for Runtime Validation
```typescript
import { z } from 'zod'

const UserSchema = z.object({
  id: z.string().uuid(),
  email: z.string().email(),
  age: z.number().min(0).max(150),
})

type User = z.infer<typeof UserSchema> // TypeScript type from schema

// Validate at runtime:
const result = UserSchema.safeParse(unknownData)
if (result.success) {
  // result.data is typed as User
}
```

## type vs interface

| | `type` | `interface` |
|--|--------|-------------|
| Object shapes | ✅ | ✅ |
| Unions | ✅ | ❌ |
| Extends/merges | ✅ (intersection `&`) | ✅ (`extends`, declaration merging) |
| Computed properties | ✅ | ❌ |
| When to use | Unions, mapped types, computed | Object shapes, class contracts |

**Rule of thumb:** Use `interface` for objects you'd document as a contract. Use `type` for everything else.

## tsconfig Best Practices

```json
{
  "compilerOptions": {
    "strict": true,
    "noUncheckedIndexedAccess": true,
    "exactOptionalPropertyTypes": true,
    "moduleResolution": "bundler",
    "target": "ES2022"
  }
}
```

## Tips

- `strict: true` catches 80% of runtime bugs at compile time. Always on.
- `noUncheckedIndexedAccess` makes `arr[0]` return `T | undefined` — forces you to handle missing items.
- Never use `as X` to silence an error — fix the type instead. `as` lies to the compiler and hides real bugs.
