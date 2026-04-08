# MCP Servers Guide

MCP (Model Context Protocol) servers give Claude real tools — browser control, web search, GitHub, databases, academic papers.

The config template is at `configs/mcp.json`. Copy it to your project root as `.mcp.json` and fill in your API keys.

---

## Essential (install these first)

### Playwright — Browser Automation
Screenshots, testing, scraping, form filling. Claude's eyes.
```json
"playwright": {
  "command": "npx",
  "args": ["@playwright/mcp@latest", "--browser", "firefox"]
}
```
**Setup**: `npx playwright install firefox chromium`
**API key**: None needed.

### Brave Search — Web Search
Fast web search from within Claude.
```json
"brave-search": {
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-brave-search"],
  "env": { "BRAVE_API_KEY": "YOUR_KEY" }
}
```
**Get key**: [brave.com/search/api](https://brave.com/search/api) — Free: 2,000 queries/month

### GitHub — Repo Management
Create PRs, search code, manage issues without leaving Claude.
```json
"github": {
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-github"],
  "env": { "GITHUB_PERSONAL_ACCESS_TOKEN": "YOUR_PAT" }
}
```
**Get key**: [github.com/settings/tokens](https://github.com/settings/tokens) — Free: unlimited

---

## Search & Research

### Exa — AI-Native Search
Better than Google for technical queries. Neural search.
```json
"exa": {
  "command": "npx",
  "args": ["-y", "exa-mcp-server"],
  "env": { "EXA_API_KEY": "YOUR_KEY" }
}
```
**Get key**: [exa.ai](https://exa.ai) — Free: 1,000 searches/month

### Paper Search — SSRN, arXiv, Semantic Scholar
Academic paper search across multiple databases in one server.
```json
"paper-search": {
  "command": "npx",
  "args": ["-y", "paper-search-mcp"],
  "env": {}
}
```
**API key**: None needed.
**Repo**: [openags/paper-search-mcp](https://github.com/openags/paper-search-mcp)

### Perplexity — Search + Reasoning
Web search with AI reasoning built in.
**Repo**: [perplexityai/modelcontextprotocol](https://github.com/perplexityai/modelcontextprotocol)
**Get key**: [perplexity.ai/settings/api](https://perplexity.ai/settings/api) — $5/month

### Google Scholar (Community)
Direct Google Scholar integration.
**Repo**: [JackKuo666/Google-Scholar-MCP-Server](https://github.com/JackKuo666/Google-Scholar-MCP-Server)

---

## Web Scraping & Extraction

### Firecrawl — Web Scraping
Crawl websites, extract structured data, scrape pages.
```json
"firecrawl": {
  "command": "npx",
  "args": ["-y", "firecrawl-mcp"],
  "env": { "FIRECRAWL_API_KEY": "YOUR_KEY" }
}
```
**Get key**: [firecrawl.dev](https://firecrawl.dev) — Free: 500 pages/month

---

## Databases & Infrastructure

### Supabase — Database
Postgres database, auth, storage, realtime.
```json
"supabase": {
  "command": "npx",
  "args": ["-y", "supabase-mcp-server"],
  "env": {
    "SUPABASE_URL": "YOUR_URL",
    "SUPABASE_SERVICE_KEY": "YOUR_KEY"
  }
}
```
**Get key**: [supabase.com](https://supabase.com) — Free: 2 projects

### Sentry — Error Tracking
Monitor errors in production apps.
```json
"sentry": {
  "command": "npx",
  "args": ["-y", "@sentry/mcp-server"],
  "env": { "SENTRY_AUTH_TOKEN": "YOUR_TOKEN" }
}
```
**Get key**: [sentry.io](https://sentry.io) — Free: 5,000 events/month

---

## API Keys Summary

All keys are **yours to create**. Sign up at each service.

| Service | URL | Free Tier |
|---------|-----|-----------|
| Brave Search | brave.com/search/api | 2,000 queries/month |
| GitHub PAT | github.com/settings/tokens | Unlimited |
| Exa | exa.ai | 1,000 searches/month |
| Firecrawl | firecrawl.dev | 500 pages/month |
| Supabase | supabase.com | 2 projects |
| Sentry | sentry.io | 5,000 events/month |
| Perplexity | perplexity.ai/settings/api | $5/month |
