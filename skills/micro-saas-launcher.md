---
name: micro-saas-launcher
description: End-to-end micro-SaaS launch playbook. Takes an idea through validation → build → monetize → launch in a structured pipeline. Includes: idea validation checklist, MVP scope definition, tech stack selection, Stripe integration, landing page, and launch checklist. Use when you want to ship a small product that makes money.
---

# /micro-saas-launcher — Ship a Product That Makes Money

From idea to first paying customer, step by step.

## Usage

```
/micro-saas-launcher [idea]
```

Examples:
- `/micro-saas-launcher an AI writing tool for job seekers`
- `/micro-saas-launcher a Notion template marketplace`
- `/micro-saas-launcher a screenshot-to-code tool`

## Phase 1: Validate Before Building

Before writing code, answer these 5 questions:

1. **Who specifically has this problem?** (Not "anyone who writes" — "marketers at B2B SaaS companies who write weekly newsletters")
2. **What do they do today?** (If the answer is "nothing", that's a red flag — they might not feel the pain)
3. **Would they pay $X/month?** (The number matters — $9/mo requires 1000 users for $9k MRR. $99/mo requires 100)
4. **Can you reach them?** (Where are they? Reddit? LinkedIn? Slack communities?)
5. **Has someone already built this?** (Competition is validation — differentiate, don't avoid)

### Validation Sprint (2-day exercise)
1. Write the landing page (headline + 3 benefits + early access form) — don't build anything
2. Post in 3 communities where your user hangs out
3. If 30+ signups in 48h → build it. Under 10 → pivot the positioning or problem.

## Phase 2: MVP Scope

Micro-SaaS MVP rule: **one core action, done well**.

```
❌ "A project management tool with time tracking, invoicing, client portal, reporting"
✅ "A time tracker that automatically generates invoices"

The second thing you cut: the second feature. Ship the one thing.
```

### MVP Checklist
- [ ] Core action works end-to-end
- [ ] User can sign up and get to value in under 5 minutes
- [ ] At least one payment option (even if just "book a call" at first)
- [ ] Basic error handling (nothing crashes on bad input)
- [ ] Mobile usable (not perfect, but usable)

## Phase 3: Stack

| Need | Choice | Why |
|------|--------|-----|
| Frontend | Next.js 15 + Tailwind v4 | Fast to build, SEO-friendly |
| Auth | Clerk or Supabase Auth | Days not weeks |
| Database | Supabase (PostgreSQL) | Free tier, generous limits |
| Payments | Stripe | Industry standard, great DX |
| Email | Resend | Simple API, good deliverability |
| Hosting | Vercel | Free tier, deploys on push |
| File storage | Cloudflare R2 | Cheap, S3-compatible |

Total infrastructure cost at launch: ~$0/month until you have users.

## Phase 4: Stripe Integration

```typescript
// Checkout session
const session = await stripe.checkout.sessions.create({
  payment_method_types: ['card'],
  line_items: [{
    price: process.env.STRIPE_PRICE_ID,
    quantity: 1,
  }],
  mode: 'subscription',
  success_url: `${process.env.NEXT_PUBLIC_URL}/dashboard?session_id={CHECKOUT_SESSION_ID}`,
  cancel_url: `${process.env.NEXT_PUBLIC_URL}/pricing`,
})
```

Always implement:
- Webhook handler (subscription created, updated, deleted)
- Customer portal (let users manage their own subscription)
- Usage limits based on subscription tier

## Phase 5: Launch Checklist

```
PRE-LAUNCH:
  [ ] Core flow works on mobile
  [ ] Stripe test mode payments work
  [ ] Stripe live mode payments work
  [ ] Error emails sent to you (not users) on exceptions
  [ ] Privacy policy + Terms of Service pages exist
  [ ] Domain is not localhost
  [ ] OG image for social sharing

LAUNCH DAY:
  [ ] Post in communities where your users are
  [ ] Product Hunt (optional but useful)
  [ ] Email early access list
  [ ] Tweet/post with a demo GIF or screenshot
  [ ] Monitor Stripe + error logs for 24 hours

WEEK 1:
  [ ] Talk to every paying customer (DM, email, Calendly)
  [ ] Talk to 5 users who signed up but didn't pay
  [ ] Ship one thing you learned from those conversations
```

## Pricing Principles

- Start higher than you think (you can always lower, rarely raise)
- Annual plan = 2 months free (20% discount) — reduces churn dramatically
- 3 tiers maximum: Free/Hobby, Pro, Team
- Free tier: enough to understand value, not enough to run a business on it

## Tips

- "Build in public" (sharing progress on Twitter/X) is a distribution strategy, not just vanity — it builds an audience before you have a product
- Your first 10 customers come from direct outreach, not SEO or ads
- Ship in 2 weeks or you'll never ship — scope aggressively
