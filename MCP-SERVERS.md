# MCP Servers Guide

MCP (Model Context Protocol) servers give Claude real tools — browser control, web search, GitHub, databases.

Copy `configs/mcp.json` to your project root as `.mcp.json` and fill in your API keys.

> **Security**: Never commit `.mcp.json` to git. Run: `echo '.mcp.json' >> .gitignore`

---

## Essential (install first)

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
Create PRs, search code, manage issues.
```json
"github": {
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-github"],
  "env": { "GITHUB_PERSONAL_ACCESS_TOKEN": "YOUR_PAT" }
}
```
**Get key**: [github.com/settings/tokens](https://github.com/settings/tokens) — Free

---

## Search & Research

### Exa — AI-Native Search
Better than Google for technical queries.
```json
"exa": {
  "command": "npx",
  "args": ["-y", "exa-mcp-server"],
  "env": { "EXA_API_KEY": "YOUR_KEY" }
}
```
**Get key**: [exa.ai](https://exa.ai) — Free: 1,000 searches/month

### Academic Papers (SSRN, arXiv, Semantic Scholar)
For research — check these community MCP servers:
- [openags/paper-search-mcp](https://github.com/openags/paper-search-mcp) — multi-database paper search
- [JackKuo666/Google-Scholar-MCP-Server](https://github.com/JackKuo666/Google-Scholar-MCP-Server) — Google Scholar
- [perplexityai/modelcontextprotocol](https://github.com/perplexityai/modelcontextprotocol) — Perplexity search + reasoning (paid: $5/month)

> These require manual setup from their GitHub repos. Follow each repo's install instructions.

---

## Web Scraping

### Firecrawl — Structured Extraction
Crawl websites, extract data.
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
Postgres, auth, storage, realtime.
```json
"supabase": {
  "command": "npx",
  "args": ["-y", "@supabase/mcp-server-supabase"],
  "env": {
    "SUPABASE_URL": "YOUR_URL",
    "SUPABASE_SERVICE_KEY": "YOUR_KEY"
  }
}
```
**Get key**: [supabase.com](https://supabase.com) — Free: 2 projects

### Sentry — Error Tracking
Monitor production errors.
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
