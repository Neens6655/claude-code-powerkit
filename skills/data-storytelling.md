---
name: data-storytelling
description: Turn raw data into a narrative that decision-makers understand and act on. Takes a dataset, spreadsheet, or list of metrics and produces: a headline finding, supporting evidence, context, and a clear recommendation. Use when you have data and need to communicate what it means, not just what it says.
---

# /data-storytelling — Data Narrative Generator

Data tells you what happened. Data storytelling tells you what it means.

## Usage

```
/data-storytelling [data or metrics]
```

Examples:
- `/data-storytelling [paste your CSV or metrics]`
- `/data-storytelling our signup rate dropped 40% this month vs last`
- `/data-storytelling we have: 1200 users, 180 DAU, 15% conversion, $12 CAC, $48 LTV`

## Output Structure

### 1. The Headline
One sentence. The single most important thing the data says.

> "Conversion is healthy, but retention is the real problem — 60% of users churn before week 2."

### 2. The Story (3-5 paragraphs)
- **What happened**: The facts, plain English
- **Why it happened**: Most likely explanations (signal from the data + reasonable inference)
- **What's unusual**: Outliers, unexpected patterns, things that don't fit
- **Context**: How does this compare to benchmarks, last period, or your stated goals?

### 3. The So What
The concrete implication. What does a decision-maker do differently knowing this?

### 4. The Recommendation
One specific action, ranked by expected impact.

```
RECOMMENDATION: Focus retention before acquisition.
Rationale: CAC ($12) is below LTV ($48) — paid acquisition is profitable.
But 60% week-2 churn means you're acquiring users who don't stick.
Improving retention from 40% to 50% increases LTV by $12, doubling current margin.
Focus: onboarding flow audit, D7 retention feature.
```

## Metric Interpretation Guide

| Metric | Healthy Range | Warning | Critical |
|--------|--------------|---------|---------|
| D30 Retention | >40% | 20-40% | <20% |
| CAC:LTV Ratio | >1:3 | 1:2 to 1:3 | <1:2 |
| Conversion (free→paid) | >5% | 2-5% | <2% |
| NPS | >50 | 20-50 | <20 |
| Churn (monthly) | <5% | 5-10% | >10% |

## Common Data Stories

### The "Everything Looks Good But..." Story
Surface the hidden problem buried in aggregate metrics.

### The Benchmark Story
Is 15% conversion good? Depends on industry. Always contextualize.

### The Correlation Story
Two metrics moving together — what's the relationship?

### The Anomaly Story
One data point doesn't fit. Why? This is often the most valuable insight.

## Presentation Formats

- **Executive summary**: 3 sentences + recommendation bullet
- **Team meeting**: narrative + supporting chart description
- **Full report**: all 4 sections + data appendix + `/canvas-design` charts

## Tips

- The best data stories have a villain (the problem) and a hero (the solution)
- Show the trendline, not just the current value — direction matters as much as magnitude
- Every chart needs a one-sentence caption that states the conclusion, not just the content
- "The data shows X" is different from "X means you should Y" — always complete the second sentence
