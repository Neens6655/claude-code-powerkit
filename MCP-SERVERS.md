# MCP Servers Guide

MCP (Model Context Protocol) servers give Claude real tools — browser control, web search, GitHub, databases, AI models, and 4,000+ web scrapers.

Copy `configs/mcp.json` to your project root as `.mcp.json` and fill in your API keys.

> **Security**: Never commit `.mcp.json` to git. Run: `echo '.mcp.json' >> .gitignore`

---

## Quick Reference

| Server | Category | Free Tier | Setup Difficulty |
|--------|----------|-----------|-----------------|
| Playwright | Browser | Free | Easy |
| Brave Search | Search | 2k/month | Easy |
| GitHub | Dev Tools | Unlimited | Easy |
| Exa | Search | 1k/month | Easy |
| Perplexity | AI Search | ~$5/month | Easy |
| Firecrawl | Scraping | 500 pages/month | Easy |
| Apify | Scraping | $5 credits/month | Easy |
| Google Maps | Geo/Data | $200/month credit | Medium |
| OpenAI | AI Models | Pay-as-you-go | Easy |
| Supabase | Database | 2 projects | Medium |
| Sentry | Monitoring | 5k events/month | Easy |
| Academic Papers | Research | Free | Medium |

---

## Essential (Install First)

### Playwright — Browser Automation
Claude's eyes. Takes screenshots, runs tests, scrapes pages, fills forms. **Required for any frontend work.**

```json
"playwright": {
  "command": "npx",
  "args": ["@playwright/mcp@latest", "--browser", "firefox"]
}
```

**Setup**: `npx playwright install firefox chromium`
**API key**: None required.
**Use cases**: Visual QA screenshots, end-to-end testing, web scraping, form automation, PDF generation.

---

### Brave Search — Web Search
Real-time web search from within any Claude session. Fast and privacy-respecting.

```json
"brave-search": {
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-brave-search"],
  "env": { "BRAVE_API_KEY": "YOUR_BRAVE_API_KEY" }
}
```

**Get key**: [brave.com/search/api](https://brave.com/search/api) — Free: 2,000 queries/month
**Use cases**: Current events, documentation lookup, library versions, competitor research.

---

### GitHub — Repository Management
Create PRs, search code, manage issues, push files, review diffs — all from Claude.

```json
"github": {
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-github"],
  "env": { "GITHUB_PERSONAL_ACCESS_TOKEN": "YOUR_GITHUB_PAT" }
}
```

**Get key**: [github.com/settings/tokens](https://github.com/settings/tokens) — Free (needs `repo`, `read:org` scopes)
**Use cases**: Auto-create PRs, search across repos, manage issues, review open PRs.

---

## Search & Research

### Exa — AI-Native Semantic Search
Finds semantically similar content, not just keyword matches. Better than Google for technical and research queries.

```json
"exa": {
  "command": "npx",
  "args": ["-y", "exa-mcp-server"],
  "env": { "EXA_API_KEY": "YOUR_EXA_API_KEY" }
}
```

**Get key**: [exa.ai](https://exa.ai) — Free: 1,000 searches/month
**Use cases**: Research papers, technical documentation, finding similar code, market intelligence.

---

### Perplexity — AI Search + Reasoning
Combines web search with AI reasoning. Best for questions that need synthesis across multiple sources.

```json
"perplexity": {
  "command": "npx",
  "args": ["-y", "perplexity-mcp"],
  "env": { "PERPLEXITY_API_KEY": "YOUR_PERPLEXITY_API_KEY" }
}
```

**Get key**: [perplexity.ai/settings/api](https://www.perplexity.ai/settings/api) — Pay-as-you-go (~$5/month typical)
**Models available**: sonar, sonar-pro, sonar-reasoning
**Use cases**: Deep research, fact-checking, technical explanations, "what's the best way to X" questions.

---

### Memory — Persistent Cross-Session Memory
Gives Claude persistent memory that survives across sessions. Store facts, preferences, and context once — Claude recalls them later.

```json
"memory": {
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-memory"]
}
```

**API key**: None required.
**Source**: Official MCP server from Anthropic/modelcontextprotocol
**Use cases**: Storing project preferences, remembering stack decisions, building a knowledge base Claude can recall.

---

## Web Scraping

### Firecrawl — Structured Web Extraction
Turn any website into clean, structured data. Handles JavaScript-heavy pages, anti-bot measures, and pagination.

```json
"firecrawl": {
  "command": "npx",
  "args": ["-y", "firecrawl-mcp"],
  "env": { "FIRECRAWL_API_KEY": "YOUR_FIRECRAWL_API_KEY" }
}
```

**Get key**: [firecrawl.dev](https://firecrawl.dev) — Free: 500 pages/month
**Use cases**: Competitor analysis, price monitoring, content extraction, bulk URL processing.

---

### Apify — 4,000+ Web Scraping Actors
Access the world's largest library of ready-made scrapers. Instagram, LinkedIn, Amazon, Google Maps, YouTube, Airbnb — all pre-built.

```json
"apify": {
  "command": "npx",
  "args": ["-y", "@apify/actors-mcp-server"],
  "env": { "APIFY_TOKEN": "YOUR_APIFY_TOKEN" }
}
```

**Get key**: [apify.com](https://apify.com) — Free: $5 credits/month (enough for ~500 actor runs)
**Use cases**: Social media scraping, e-commerce data, Google Maps data, job listings, real estate, news aggregation.

**Popular Actors Claude can run via this MCP**:
- `apify/instagram-scraper` — Posts, profiles, hashtags
- `apify/google-maps-scraper` — Places, reviews, contact info
- `apify/amazon-product-scraper` — Prices, reviews, ASINs
- `apify/linkedin-scraper` — Company and profile data
- `apify/youtube-scraper` — Videos, channels, comments
- `apify/twitter-scraper` — Tweets, profiles, trends
- `apify/airbnb-scraper` — Listings, prices, reviews

---

## AI Models

### OpenAI — GPT-4o and Other Models
Access OpenAI models from Claude sessions via the community `mcp-openai` server.

```json
"openai-compatible": {
  "command": "npx",
  "args": ["-y", "mcp-openai"],
  "env": { "OPENAI_API_KEY": "YOUR_OPENAI_API_KEY" }
}
```

**Get key**: [platform.openai.com/api-keys](https://platform.openai.com/api-keys) — Pay-as-you-go
**Models available**: gpt-4o, gpt-4o-mini, dall-e-3
**Use cases**: Image generation (DALL-E), getting a second opinion from GPT-4o, code comparison.
**Note**: No official OpenAI MCP server is published. This uses the `mcp-openai` community package.

---

## Geo & Data

### Google Maps — Places, Geocoding, Routing
Full Google Maps Platform API access — search places, geocode addresses, get directions, calculate distances.

```json
"google-maps": {
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-google-maps"],
  "env": { "GOOGLE_MAPS_API_KEY": "YOUR_GOOGLE_MAPS_API_KEY" }
}
```

**Get key**: [console.cloud.google.com](https://console.cloud.google.com) → APIs & Services → Enable Maps JavaScript API
**Free tier**: $200/month free credit (covers ~40k geocoding requests or ~28k directions)
**Use cases**: Location-based apps, address validation, distance calculations, store finders, logistics.

---

## Databases & Infrastructure

### Supabase — Postgres + Auth + Storage
Full Supabase access — query databases, manage auth, handle storage, watch realtime events.

```json
"supabase": {
  "command": "npx",
  "args": ["-y", "@supabase/mcp-server-supabase"],
  "env": {
    "SUPABASE_URL": "YOUR_SUPABASE_URL",
    "SUPABASE_SERVICE_KEY": "YOUR_SUPABASE_SERVICE_KEY"
  }
}
```

**Get key**: [supabase.com](https://supabase.com) → Project Settings → API — Free: 2 projects
**Use cases**: Database migrations, querying production data, auth debugging, storage management.

---

### Sentry — Error Monitoring
Monitor production errors, view stack traces, manage issues — without leaving Claude.

```json
"sentry": {
  "command": "npx",
  "args": ["-y", "@sentry/mcp-server"],
  "env": { "SENTRY_AUTH_TOKEN": "YOUR_SENTRY_AUTH_TOKEN" }
}
```

**Get key**: [sentry.io](https://sentry.io) → Settings → Auth Tokens — Free: 5,000 events/month
**Use cases**: Debugging production errors, tracking error frequency, correlating errors with deploys.

---

## Complete mcp.json

Copy this to your project as `.mcp.json` and replace `YOUR_*` with your actual keys:

```json
{
  "mcpServers": {
    "playwright": {
      "command": "npx",
      "args": ["@playwright/mcp@latest", "--browser", "firefox"]
    },
    "brave-search": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-brave-search"],
      "env": { "BRAVE_API_KEY": "YOUR_BRAVE_API_KEY" }
    },
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": { "GITHUB_PERSONAL_ACCESS_TOKEN": "YOUR_GITHUB_PAT" }
    },
    "exa": {
      "command": "npx",
      "args": ["-y", "exa-mcp-server"],
      "env": { "EXA_API_KEY": "YOUR_EXA_API_KEY" }
    },
    "perplexity": {
      "command": "npx",
      "args": ["-y", "perplexity-mcp"],
      "env": { "PERPLEXITY_API_KEY": "YOUR_PERPLEXITY_API_KEY" }
    },
    "firecrawl": {
      "command": "npx",
      "args": ["-y", "firecrawl-mcp"],
      "env": { "FIRECRAWL_API_KEY": "YOUR_FIRECRAWL_API_KEY" }
    },
    "apify": {
      "command": "npx",
      "args": ["-y", "@apify/actors-mcp-server"],
      "env": { "APIFY_TOKEN": "YOUR_APIFY_TOKEN" }
    },
    "google-maps": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-google-maps"],
      "env": { "GOOGLE_MAPS_API_KEY": "YOUR_GOOGLE_MAPS_API_KEY" }
    },
    "openai-compatible": {
      "command": "npx",
      "args": ["-y", "mcp-openai"],
      "env": { "OPENAI_API_KEY": "YOUR_OPENAI_API_KEY" }
    },
    "supabase": {
      "command": "npx",
      "args": ["-y", "@supabase/mcp-server-supabase"],
      "env": {
        "SUPABASE_URL": "YOUR_SUPABASE_URL",
        "SUPABASE_SERVICE_KEY": "YOUR_SUPABASE_SERVICE_KEY"
      }
    },
    "sentry": {
      "command": "npx",
      "args": ["-y", "@sentry/mcp-server"],
      "env": { "SENTRY_AUTH_TOKEN": "YOUR_SENTRY_AUTH_TOKEN" }
    },
    "memory": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-memory"]
    }
  }
}
```

---

## API Keys Summary

| Service | URL | Free Tier | Required For |
|---------|-----|-----------|-------------|
| Brave Search | [brave.com/search/api](https://brave.com/search/api) | 2,000 queries/month | Web search |
| GitHub PAT | [github.com/settings/tokens](https://github.com/settings/tokens) | Unlimited | Repo management |
| Exa | [exa.ai](https://exa.ai) | 1,000 searches/month | Semantic search |
| Perplexity | [perplexity.ai/settings/api](https://www.perplexity.ai/settings/api) | ~$5/month | AI search + reasoning |
| Firecrawl | [firecrawl.dev](https://firecrawl.dev) | 500 pages/month | Web scraping |
| Apify | [apify.com](https://apify.com) | $5 credits/month | 4,000+ scrapers |
| Google Maps | [console.cloud.google.com](https://console.cloud.google.com) | $200 credit/month | Geo/places data |
| OpenAI | [platform.openai.com/api-keys](https://platform.openai.com/api-keys) | Pay-as-you-go | GPT-4o, DALL-E |
| Supabase | [supabase.com](https://supabase.com) | 2 projects | Database |
| Sentry | [sentry.io](https://sentry.io) | 5,000 events/month | Error monitoring |

**Recommended start order**: Playwright (free, no key) → Brave Search → GitHub PAT → Exa. These four alone handle 80% of use cases.

---

## Troubleshooting

**MCP tool not appearing**: Claude defers MCP schemas. Say *"load the [tool-name] tools"* — Claude will find and load the schema.

**`command not found: npx`**: Install Node.js 18+ from [nodejs.org](https://nodejs.org).

**Tool runs but returns errors**: Check your API key is correct and the service is reachable. Most issues are bad keys or expired free tiers.

**Playwright fails on Linux**: Run `npx playwright install --with-deps` to install browser dependencies.
