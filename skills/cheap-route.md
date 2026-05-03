---
name: cheap-route
description: Route low-stakes tasks to faster, cheaper AI models via OpenRouter to preserve Claude quota for important work. Use for: code explanation, docstrings, bulk summaries, content classification, research, trivial refactors, and boilerplate generation. NEVER use for: verdicts, security review, architecture decisions, or anything you'll act on directly.
---

# /cheap-route — Smart Model Routing

Use the right model for the right task. Preserve Claude Max for what matters.

## Usage

```
/cheap-route [task]
```

Examples:
- `/cheap-route explain what this 200-line module does`
- `/cheap-route write docstrings for these 15 functions`
- `/cheap-route summarize these 20 blog posts`
- `/cheap-route classify these 500 customer feedback items`
- `/cheap-route write boilerplate for a CRUD API with these 5 endpoints`

## When to Use Cheap Route

| Task | Route to |
|------|----------|
| Code explanation | OpenRouter → Gemini Flash or DeepSeek |
| Docstring generation | OpenRouter → Gemini Flash |
| Bulk summarization | OpenRouter → Gemini Flash Lite |
| Content classification | OpenRouter → Gemini Flash Lite |
| Literature research | OpenRouter → Perplexity Sonar |
| Boilerplate generation | OpenRouter → DeepSeek Coder |
| Trivial refactors | OpenRouter → Gemini Flash |
| Draft copy (to be edited) | OpenRouter → Gemini Flash |

## When NOT to Use Cheap Route

| Task | Keep on Claude |
|------|----------------|
| Security review | Claude |
| Architecture decisions | Claude |
| Final verdicts / recommendations | Claude |
| Anything with financial implications | Claude |
| Code you'll ship without reviewing | Claude |
| Complex debugging | Claude |
| Plato advisors | Claude |

## OpenRouter Setup

1. Get API key from openrouter.ai
2. Add to your MCP config (already included in this kit's `configs/mcp.json`)
3. OpenRouter routes to 100+ models with one API key

## Cost Reference (approximate)

| Model | Input (per 1M tokens) | Use Case |
|-------|----------------------|---------|
| Gemini 2.0 Flash | $0.10 | General cheap tasks |
| Gemini Flash Lite | $0.02 | Bulk classification |
| DeepSeek Chat | $0.14 | Code tasks |
| Perplexity Sonar | $1.00 + search | Research with web access |
| Claude Sonnet 4.5 | $3.00 | Complex reasoning |
| Claude Opus 4 | $15.00 | Verdicts, architecture |

**Rule of thumb:** cheap-route tasks that are 10-50× cheaper elsewhere and you'd spend more reviewing than they cost.

## Output Quality Expectation

Cheap-route output is a DRAFT, not a final answer:
- Code explanation: review for accuracy
- Docstrings: edit for style
- Summaries: verify key points not missed
- Research: verify sources, don't cite without checking

**The cheap-route rule:** if you wouldn't trust a junior intern's first draft for a task, verify cheap-route output before using it.

## Tips

- Batch similar tasks — send 20 docstrings in one request instead of 20 separate calls
- For research: use Perplexity Sonar (has web search) rather than Gemini (knowledge cutoff)
- The OpenRouter MCP in this kit gives you access to all these models from the Claude Desktop chat
- Model choice matters less for mechanical tasks (docstrings, classification) than for judgment tasks
