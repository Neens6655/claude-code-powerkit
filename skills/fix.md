---
name: fix
description: Fix bugs described in plain English. Use when something is broken, not working as expected, shows an error, or behaves wrong. Accepts a plain-language description of the problem (and optionally an error message or screenshot path), traces the root cause, explains what's wrong in simple terms, proposes a scoped fix, waits for approval, applies it, and verifies. Prevents entropy loops by scoping fixes tightly and never rewriting unrelated code. Use when asked to "fix this", "something is broken", "I'm getting an error", "this doesn't work", or "debug this".
---

# /fix — Plain-English Bug Fixing

Describe what's wrong. Claude traces, explains, fixes, and verifies — without touching anything it doesn't need to.

## Usage

```
/fix [description of the problem]
```

Examples:
- `/fix the gallery filter doesn't work when I click a category`
- `/fix I get a blank page after signing up`
- `/fix the checkout button does nothing`
- `/fix error: Cannot read properties of undefined (reading 'map')`
- `/fix the layout is broken on mobile`

You can also paste an error message, a screenshot path, or a URL where the bug happens.

## Workflow

### Step 1: Understand the Report

Parse what was given:
- **Symptom:** What the user sees (or doesn't see)
- **Expected:** What should happen instead (ask if not clear)
- **Error message:** Extract file, line, error type if provided
- **Screenshot:** If a path is provided, read the image

If the report is too vague, ask ONE clarifying question:
> "When you say [X], do you mean [A] or [B]?"

Do NOT ask multiple questions. Get enough to start tracing, then trace.

### Step 2: Trace the Root Cause

Read the relevant code. Follow the execution path from the user's action to where it breaks.

**Tracing tools (use when available):**
- **Playwright MCP** → Reproduce the bug in a browser — navigate, perform the action, capture the error
- **Browser console** → Read console errors, network failures from the live page
- **Firecrawl** → If the bug is on a live URL, fetch and analyze the page

**Manual tracing strategy:**
1. Start from the entry point the user described (the page, button, function)
2. Read CLAUDE.md if it exists — understand project conventions
3. Follow the data flow: event → handler → logic → output
4. Identify where expected behavior diverges from actual behavior

Use an Explore sub-agent for complex traces spanning multiple files.

**Do NOT:**
- Guess without reading the code
- Assume the user's diagnosis is correct — verify independently
- Read every file in the project — trace only the relevant path

### Step 3: Explain in Plain English

Before touching any code:

```
WHAT'S WRONG:
[1-2 sentences in plain language — no jargon]

WHY IT HAPPENS:
[1-2 sentences explaining the root cause]

THE FIX:
[What you plan to change — which file(s), what the change does]

SCOPE:
[X file(s) modified, Y lines changed]
Nothing else is touched.
```

**Language rules:**
- "The button click handler" → "The code that runs when you click the button"
- "The state isn't updating" → "The page isn't remembering the new value"
- "Null reference error" → "The code is trying to use something that doesn't exist yet"
- "Race condition" → "Two things are happening at the same time and stepping on each other"

Wait for user approval before applying the fix.

### Step 4: Apply the Fix

After approval:
1. Make the minimum change needed
2. Follow existing code conventions (read CLAUDE.md)
3. Do NOT refactor surrounding code
4. Do NOT add features
5. Do NOT touch files not mentioned in Step 3

### Step 5: Verify

After applying the fix:
- **Playwright** → Re-run the reproduction steps — confirm the bug is gone
- **Tests** → Run existing tests if they exist
- **Build** → Run build if the project has one — must exit 0
- **Manual check** → Describe what to test: "To verify: [do the action]. You should now see [expected result]."

### Step 6: Commit (optional)

Offer to commit with a clear message:
```
Fix: [one-line description of what was fixed]
Root cause: [one-line technical cause]
```

## Anti-Entropy Rules

These prevent the #1 failure mode in AI-assisted development:

1. **One bug, one fix.** Do not bundle improvements.
2. **Scope lock.** Only touch files identified in Step 3. Need more? Go back to Step 3.
3. **No drive-by refactoring.** Leave ugly code near the bug alone.
4. **No feature creep.** Suggest additional improvements separately, after the fix.
5. **Revert over stack.** If a fix attempt makes things worse, revert and try differently.

## Edge Cases

**"I don't know what's wrong, it just doesn't work"**
Ask: "What were you trying to do, and what happened instead?"

**Error message but no context**
Parse the error for file path and line number. Read that file. Ask: "What were you doing when this appeared?"

**The fix seems risky (touches auth, payments, data)**
State the risk: "This change touches [sensitive area]. Here's exactly what changes and what doesn't."
Recommend specific testing steps.

**You suspect the fix will break something else**
Say so: "This fix solves [problem], but it might affect [other thing]. Want me to check that area too?"
