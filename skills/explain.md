---
name: explain
description: Explain any code, file, project, or error in plain English. Use when the user wants to understand what something does, how it works, why it exists, or what an error means. Accepts a file path, folder, function name, error message, or concept. Produces layered explanations — a one-liner, a paragraph, and optionally a deep dive. Never assumes coding knowledge. Use when asked to "explain this", "what does this do", "how does this work", "what is this file for", "walk me through this", "I don't understand this error", or "teach me about this".
---

# /explain — Plain-English Code Explainer

Turn any code, file, project structure, or error message into something anyone can understand. No jargon. No assumptions. Just clear answers.

## Usage

```
/explain [target]
```

Where `[target]` can be:
- A file path: `/explain src/utils/auth.js`
- A folder: `/explain src/api/`
- A function: `/explain the handleSubmit function in ContactForm.jsx`
- An error message: `/explain "TypeError: Cannot read properties of undefined"`
- A concept: `/explain what a webhook is`
- A project: `/explain this project` (reads CLAUDE.md + key files)
- A diff: `/explain what changed in the last commit`

## Workflow

### Step 1: Identify What to Explain

| Target | Action |
|--------|--------|
| File path | Read the file |
| Folder | List contents, read key files (index, main, README) |
| Function name | Find it in the codebase, read the file |
| Error message | Parse the error, find the referenced file/line |
| Concept | Explain from knowledge (no file reads needed) |
| "This project" | Read CLAUDE.md, package.json, key entry points |
| "Last commit" | Run `git diff` or `git log` and read changed files |

If the target is ambiguous, ask ONE clarifying question.

### Step 2: Explain in Layers

Always provide the **One-Liner** and **Paragraph**. Add the **Deep Dive** only if asked or the target is complex.

#### Layer 1: One-Liner
One sentence. What does this thing DO?

> "This file handles user login — it checks the password and creates a session."

Rules:
- Max 20 words
- No technical terms unless the user used them first
- Starts with "This [file/function/project/error]..."

#### Layer 2: Paragraph
3-5 sentences. Cover the what, why, and how. Use analogies when helpful.

> "Think of it like a bouncer at a club — it checks your ID before letting you in."

#### Layer 3: Deep Dive (on request only)
A structured breakdown. Trigger when:
- User says "tell me more" or "go deeper"
- The target is a whole project or complex system
- The target has 3+ interconnected parts

### Step 3: Offer Next Steps

After explaining, offer exactly ONE follow-up:
- If it's a file: "Want me to explain how this connects to [related file]?"
- If it's an error: "Want me to `/fix` this?"
- If it's a project: "Want me to explain any specific part in more detail?"

## Jargon Translation

Always translate technical terms into plain English:

| Jargon | Say Instead |
|--------|------------|
| API | "a way for two programs to talk to each other" |
| Endpoint | "a specific URL the app listens to" |
| Middleware | "code that runs in between — like a checkpoint" |
| Callback | "a function that runs later, when something finishes" |
| Promise / async | "code that waits for something before continuing" |
| State | "the current data the app is remembering right now" |
| Props | "settings passed into a component" |
| Hook | "a built-in helper function (React)" |
| Dependency | "another package this project needs to work" |
| ENV variable | "a secret setting stored outside the code" |
| Schema | "the structure — what fields exist and what type they are" |
| Migration | "a script that changes the database structure" |
| Deployment | "putting the app live on the internet" |
| CI/CD | "automatic testing and deployment when you push code" |
| WebSocket | "a live connection — like a phone call instead of texting" |

## Error Explanation Format

When explaining errors, always provide:

1. **What happened** (plain English)
2. **Why it happened** (most common cause)
3. **What to do** (the fix, or offer `/fix`)

Example:
> **Error:** `TypeError: Cannot read properties of undefined (reading 'map')`
>
> **What happened:** The code tried to loop through a list, but the list doesn't exist yet.
>
> **Why:** The data probably hasn't loaded from the server yet, and the code ran before it arrived.
>
> **What to do:** Add a check that waits for the data before looping. Want me to `/fix` this?

## What /explain Does NOT Do

- Does not write code — it explains only
- Does not fix bugs — it explains, then offers `/fix`
- Does not refactor — explains current state, not ideal state
- Does not judge — no "this code is bad". Neutral explanations only.

## Tone

- Friendly, patient, zero condescension
- "Think of it like..." is your best friend
- Short sentences. Short paragraphs.
- If something IS confusing code: "This is genuinely hard to follow — it's not you, the code is complex"
