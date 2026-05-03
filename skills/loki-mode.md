---
name: loki-mode
description: Adversarial pre-ship review. Loki plays the role of a hostile user, security researcher, and angry investor simultaneously — trying to break your product, find data leaks, exploit edge cases, and poke holes in your business logic before real users do. Run before any public launch.
---

# /loki-mode — Adversarial Pre-Ship Review

What would a hostile user, a security researcher, and an angry investor find wrong with your product?

Find out before they do.

## Usage

```
/loki-mode
/loki-mode [specific area: security|business-logic|ux|data]
```

## Three Attackers

### 1. The Hostile User
Tries to break the product through normal usage:
- What happens if I submit the form 100 times?
- Can I access other users' data by changing the URL ID?
- What if I paste 50,000 characters in that text field?
- Can I upload a .exe as a profile picture?
- What if I open the app on a 320px screen?
- Can I navigate backwards in the browser and cause weird state?

### 2. The Security Researcher
Looks for exploitable vulnerabilities:
- Are there any SQL injection vectors?
- Can I escalate my privileges (user → admin)?
- Are there IDOR (Insecure Direct Object Reference) vulnerabilities? (accessing `/api/users/123` when I'm user 456)
- Is the JWT validated server-side?
- Can I exfiltrate data through the API without authentication?
- Are there stored XSS vectors?
- What data is logged, and could it contain PII?

### 3. The Angry Investor
Questions the business logic:
- Can someone use this for free forever by staying just under the usage limit?
- What happens when a user deletes their account — is their data actually deleted?
- Can competitors scrape all our data through the public API?
- What's the data retention policy — are we storing things we shouldn't?
- What happens if a payment fails mid-transaction?

## Attack Report Format

```
LOKI ATTACK REPORT — [Product] — [Date]

🔴 CRITICAL (ships with 0 of these):
  IDOR-01: GET /api/posts/:id returns any post regardless of auth
    → Logged-in user can read any user's private posts
    → Fix: add ownership check in the handler
  
  INJECT-01: Search query passed directly to SQL
    → Input: "'; DROP TABLE users; --"
    → Fix: use parameterized queries

🟠 HIGH:
  FLOOD-01: No rate limiting on /api/signup
    → Can create 10,000 accounts in minutes
    → Fix: rate limit to 5/minute per IP

  STATE-01: Cart persists after logout
    → User A's cart visible to User B on same device
    → Fix: clear cart on logout

🟡 MEDIUM:
  PII-01: User email logged in server.log on every request
    → Exposes emails if logs are compromised
    → Fix: log user ID only

🟢 LOW:
  UX-01: Back button after checkout shows empty cart (confusing but not exploitable)
  
VERDICT: NOT READY TO SHIP (2 Critical issues)
Fix Critical → re-run /loki-mode → then ship.
```

## Loki's Favorite Questions

For every form:
- What's the max input length? Is it enforced server-side?
- What happens with Unicode, emoji, RTL text, null bytes?

For every API endpoint:
- Is authentication required? Is it actually checked?
- Is authorization checked (can this user access THIS resource)?
- Is input validated before use?

For every file upload:
- Is the file type validated server-side (not just client-side)?
- Are files scanned for malware?
- Can an uploaded file be served in a way that executes?

## Tips

- The most common critical issue in AI-built apps: IDOR (accessing other users' data by changing IDs in the URL)
- Security issues are non-negotiable. No critical issues ship.
- Run Loki after every major feature, not just at launch
- Many "medium" issues become "critical" at scale — rate limiting matters at 100 users, critical at 10,000
