---
name: mcp-builder
description: Build custom MCP (Model Context Protocol) servers that give Claude new tools. Use when you want Claude to interact with a custom API, internal database, or proprietary service. Produces a working MCP server in TypeScript (Node.js) with proper schemas, error handling, and claude_desktop_config.json registration.
---

# /mcp-builder — Custom MCP Server Builder

Give Claude custom tools that connect to anything.

## Usage

```
/mcp-builder [what you want Claude to be able to do]
```

Examples:
- `/mcp-builder query our internal analytics database`
- `/mcp-builder read and write to our Notion workspace`
- `/mcp-builder send Slack messages to specific channels`
- `/mcp-builder search our product catalog`

## What MCP Is

MCP (Model Context Protocol) is how Claude connects to external tools and data sources. Each MCP server exposes a set of "tools" that Claude can call during a conversation — like browsing the web, reading files, or querying a database.

**Think of it like:** plugins for Claude. You write the plugin, Claude calls it.

## What Gets Built

### 1. MCP Server (`src/index.ts`)
```typescript
import { McpServer } from "@modelcontextprotocol/sdk/server/mcp.js"
import { z } from "zod"

const server = new McpServer({
  name: "my-server",
  version: "1.0.0",
})

server.tool(
  "search_products",
  "Search the product catalog by name or category",
  {
    query: z.string().describe("Search query"),
    category: z.string().optional().describe("Filter by category"),
    limit: z.number().min(1).max(50).default(10),
  },
  async ({ query, category, limit }) => {
    const results = await db.products.search({ query, category, limit })
    return {
      content: [{
        type: "text",
        text: JSON.stringify(results, null, 2),
      }]
    }
  }
)
```

### 2. Package Setup (`package.json`)
```json
{
  "name": "my-mcp-server",
  "type": "module",
  "bin": { "my-mcp": "dist/index.js" },
  "scripts": { "build": "tsc", "dev": "tsx watch src/index.ts" },
  "dependencies": {
    "@modelcontextprotocol/sdk": "^1.0.0",
    "zod": "^3.0.0"
  }
}
```

### 3. Claude Desktop Config (`claude_desktop_config.json`)
```json
{
  "mcpServers": {
    "my-server": {
      "command": "node",
      "args": ["/path/to/my-mcp-server/dist/index.js"],
      "env": {
        "DATABASE_URL": "your-connection-string"
      }
    }
  }
}
```

## Tool Design Principles

**Good tools are:**
- **Atomic** — one clear action per tool
- **Typed** — Zod schemas for all inputs, with `.describe()` on every field
- **Safe** — validate inputs, handle errors, never expose raw stack traces
- **Idempotent where possible** — calling twice has same effect as calling once

**Name tools clearly:**
- `search_products` not `search`
- `create_invoice` not `create`
- `get_user_by_email` not `getUser`

## Error Handling Pattern
```typescript
async ({ query }) => {
  try {
    const result = await externalApi.call(query)
    return { content: [{ type: "text", text: JSON.stringify(result) }] }
  } catch (error) {
    return {
      isError: true,
      content: [{
        type: "text",
        text: `Error: ${error instanceof Error ? error.message : "Unknown error"}`
      }]
    }
  }
}
```

## Common MCP Servers to Build

| Goal | Tools to Expose |
|------|----------------|
| Internal database | `query`, `insert`, `update` |
| REST API wrapper | mirror the API's endpoints as tools |
| File system | `read_file`, `write_file`, `list_directory` |
| Email/notifications | `send_email`, `list_inbox`, `get_thread` |
| CMS | `get_page`, `update_page`, `list_posts` |

## Tips

- Start with 2-3 tools, not 20. Add more as you discover what Claude actually uses.
- Every tool description is read by Claude to decide when to call it. Write it for Claude, not for humans.
- MCP servers run as local processes — they can access anything your machine can access.
- Restart Claude Desktop after changing `claude_desktop_config.json`.
