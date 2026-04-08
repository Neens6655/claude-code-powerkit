# Launch Post Drafts

Copy-paste ready posts for launching this kit. Post on a Tuesday or Wednesday morning (9-11am ET) for peak reach.

---

## Twitter / X Thread

**Tweet 1 (hook):**
```
Most developers spend their first week configuring Claude Code.

I distilled 300+ hours of production usage into a one-command setup kit.

12 MCP servers. 48+ skills. Working hooks. Zero config hell.

→ github.com/Neens6655/claude-code-powerkit

Here's what you get 🧵
```

**Tweet 2 (MCP servers):**
```
After running bash setup.sh, Claude can:

🌐 Search the web (Brave Search)
🖥️ Control a browser (Playwright)
💻 Manage your GitHub repos
🔍 Do AI-native research (Exa + Perplexity)
🗺️ Query Google Maps
🐛 Monitor Sentry errors
🕷️ Run 4,000+ web scrapers (Apify)

All pre-configured. Fill in your API keys and go.
```

**Tweet 3 (skills):**
```
48+ skills that give Claude deep domain expertise:

/architect → full system design before touching code
/react-best-practices → 40+ Vercel engineering rules
/vibe-code-auditor → catches fragile AI code patterns
/plato → 8-advisor AI council that stress-tests your product
/beautiful-prose → kills generic AI writing voice
/mcp-builder → builds new MCP servers from scratch

Type /skill-name in any Claude session.
```

**Tweet 4 (hooks):**
```
The settings.json ships with 3 safety hooks:

1. Blocks npm/yarn — forces bun
2. Reminds you to verify the build after frontend edits
3. Quality gate at session end: "Did you run tests? Did Playwright screenshot?"

Hooks you install once, protect you every session.
```

**Tweet 5 (CTA):**
```
Everything is in one repo:

⭐ Star it if it saves you setup time
🔧 Open an issue if something breaks
🤝 PR welcome for new skills or MCP servers

→ github.com/Neens6655/claude-code-powerkit
```

---

## Reddit — r/ClaudeAI

**Title:**
```
I spent 300 hours configuring Claude Code — here's everything I learned in one setup kit
```

**Body:**
```
After 300+ hours building production tools with Claude Code, I noticed I was doing the same config work on every new project: setting up MCP servers, copying hooks, finding the right skills, figuring out which npm packages were broken.

So I packaged it all into a one-command setup kit: **Claude Code Powerkit**

**What it does:**

Run `bash setup.sh` and you get:
- 12 MCP servers pre-configured (Playwright, Brave, GitHub, Exa, Perplexity, Apify, Google Maps, Supabase, Sentry, and more)
- 3 safety hooks (blocks npm/yarn in favor of bun, flags frontend edits for build check, quality gate on stop)
- 6 Claude Code plugins enabled
- A CLAUDE.md template for your project

**Then you pick from 48+ skills:**
- `/react-best-practices` — 40+ performance rules from Vercel Engineering
- `/vibe-code-auditor` — catches fragile AI-generated code patterns
- `/beautiful-prose` — eliminates generic AI voice in writing
- `/plato` — spawns an 8-advisor AI council to audit your product
- `/mcp-builder` — builds new MCP servers from scratch
- and 43 more in [SKILLS.md](https://github.com/Neens6655/claude-code-powerkit/blob/master/SKILLS.md)

**Hard-won lessons (from TIPS.md):**
- MCP tools are deferred — Claude doesn't load them until you ask. If a tool seems missing, say "load the Playwright tools"
- Files over 2,000 lines get silently truncated — always check `wc -l` first
- Never ship frontend without Playwright screenshots — code-only audits miss rendering bugs every time

**Quick start:**
```bash
git clone https://github.com/Neens6655/claude-code-powerkit.git
cd claude-code-powerkit
bash setup.sh
# Immediate test (no API key): claude "take a Playwright screenshot of google.com"
```

Feedback welcome — especially if you find broken packages or have skills to add.
```

---

## Hacker News

**Title:**
```
Show HN: Claude Code Powerkit – one-command setup with 12 MCP servers and 48 skills
```

**Body:**
```
I've been building production tools with Claude Code for 300+ hours. Every new project started with the same hour of setup: finding which MCP packages exist, copying hooks from old projects, hunting for useful skills across 20 different GitHub repos.

So I packaged it: https://github.com/Neens6655/claude-code-powerkit

One bash script installs Playwright, copies pre-configured hooks (package manager enforcement, frontend build reminders, quality gates), and enables Claude Code plugins.

The repo also includes:
- 12 MCP server configs (Playwright, Brave Search, GitHub, Exa, Perplexity, Firecrawl, Apify, Google Maps, OpenAI, Supabase, Sentry, Memory) — all with exact JSON configs and free tier info
- A catalog of 48 installable skills with exact install commands (skills are markdown files that give Claude domain expertise)
- 40+ GitHub repos worth exploring for more skills
- 12 production tips I learned the hard way

The hardest part was finding which npm packages actually exist. The Apify MCP package, for example, is @apify/actors-mcp-server — not @apify/mcp-server, and there's no official OpenAI MCP server published despite what you'll see in tutorials.

Happy to answer questions about any of it.
```

---

## Dev.to / Hashnode Article Outline

**Title:** "I spent 300 hours configuring Claude Code so you don't have to"

**Sections:**
1. The problem (setup hell every new project)
2. The solution (what the kit includes)
3. The 3 hooks you need (package manager, build check, quality gate)
4. The 10 skills that changed how I work
5. MCP servers ranked by usefulness (with honest free tier info)
6. The 12 production tips from TIPS.md
7. Call to action (star + contribute)
