# MCP Servers Guide

11 pre-configured MCP servers. Copy `configs/mcp.json` to your project root as `.mcp.json`, fill in API keys, and add `.mcp.json` to `.gitignore`.

**Never commit `.mcp.json` to git** — it contains your API keys.

---

## Start Here (No Key Needed)

### Playwright — Browser Automation
Control real browsers. Screenshots, testing, scraping. Works immediately after setup.

```json
"playwright": {
  "command": "npx",
  "args": ["@playwright/mcp@latest", "--browser", "chromium"]
}
```

**Test it:** `Take a Playwright screenshot of google.com`

---

### Memory — Persistent Knowledge
Remember facts, preferences, and context across sessions.

```json
"memory": {
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-memory"]
}
```

**Use it:** `Remember: I use bun, never npm`

---

## Search & Research

### Brave Search
Real-time web search. 2,000 free queries/month.
Get key: [api.search.brave.com](https://api.search.brave.com)

```json
"brave-search": {
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-brave-search"],
  "env": { "BRAVE_API_KEY": "YOUR_KEY" }
}
```

### Perplexity — AI Research
Search + synthesize. Better than raw web search for research tasks.
Get key: [perplexity.ai/settings/api](https://www.perplexity.ai/settings/api)

```json
"perplexity": {
  "command": "npx",
  "args": ["-y", "perplexity-mcp"],
  "env": { "PERPLEXITY_API_KEY": "YOUR_KEY" }
}
```

---

## Web Data

### Firecrawl — Structured Scraping
Convert any website to clean markdown or structured JSON. 500 pages/mo free.
Get key: [firecrawl.dev](https://firecrawl.dev)

```json
"firecrawl": {
  "command": "npx",
  "args": ["-y", "firecrawl-mcp"],
  "env": { "FIRECRAWL_API_KEY": "YOUR_KEY" }
}
```

### Apify — 4,000+ Scrapers
Pre-built scrapers for Instagram, LinkedIn, Amazon, TikTok, and thousands more.
Get key: [apify.com](https://apify.com)

```json
"apify": {
  "command": "npx",
  "args": ["-y", "@apify/actors-mcp-server"],
  "env": { "APIFY_TOKEN": "YOUR_KEY" }
}
```

---

## Development

### GitHub
Create PRs, manage issues, push files, search code. Free with any GitHub account.
Get token: [github.com/settings/tokens](https://github.com/settings/tokens) — select `repo` scope

```json
"github": {
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-github"],
  "env": { "GITHUB_PERSONAL_ACCESS_TOKEN": "YOUR_TOKEN" }
}
```

### Google Maps
Places, geocoding, routing, distance calculations. $200 free credit/month.
Get key: [console.cloud.google.com](https://console.cloud.google.com)

```json
"google-maps": {
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-google-maps"],
  "env": { "GOOGLE_MAPS_API_KEY": "YOUR_KEY" }
}
```

---

## AI Models

### OpenRouter — 100+ LLMs
Access GPT-4o, Claude, Gemini, Llama, Mistral, and 100+ more from one API key.
Also powers `/cheap-route` skill for cost-efficient task routing.
Get key: [openrouter.ai/keys](https://openrouter.ai/keys) — free models available

```json
"openrouter": {
  "command": "npx",
  "args": ["-y", "mcp-openai"],
  "env": {
    "OPENAI_API_KEY": "YOUR_OPENROUTER_KEY",
    "OPENAI_BASE_URL": "https://openrouter.ai/api/v1"
  }
}
```

> Tip: OpenRouter replaces a dedicated OpenAI key — it's a superset that includes OpenAI models plus 100+ others.

### Replicate — 50,000+ AI Models
Image generation, video synthesis, audio, 3D models, and more.
Get token: [replicate.com/account/api-tokens](https://replicate.com/account/api-tokens)

```json
"replicate": {
  "command": "npx",
  "args": ["-y", "replicate-mcp"],
  "env": { "REPLICATE_API_TOKEN": "YOUR_TOKEN" }
}
```

### Gemini — Google AI Direct
Gemini 2.5 Pro and Flash. Best-in-class reasoning and long context.
Generous free tier. Get key: [aistudio.google.com/apikey](https://aistudio.google.com/apikey)

```json
"gemini": {
  "command": "npx",
  "args": ["-y", "@yuhuangbin/mcp-gemini"],
  "env": { "GEMINI_API_KEY": "YOUR_KEY" }
}
```

---

## Recommended Setup Order

1. **Playwright** — no key, test immediately
2. **Memory** — no key, start remembering preferences
3. **Brave Search** — 5 min to get key, unlocks web search
4. **GitHub** — 5 min, unlocks repo automation
5. **Gemini** — 2 min, generous free tier, huge value
6. **Firecrawl** — scraping and research
7. **OpenRouter** — when you need multiple LLMs or cost routing
8. Others as needed

These first 4 cover 80% of use cases.
