#!/usr/bin/env bash
set -e

# ============================================
# Ziad StarterKit - Claude Code Setup Script
# ============================================
# Run in: macOS Terminal, Linux shell, Git Bash, or WSL
# NOT supported: Windows PowerShell, CMD

echo ""
echo "  Ziad StarterKit"
echo "  Claude Code Setup"
echo "  -----------------"
echo ""

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_DIR="$HOME/.claude"

# ---- Phase 1: Prerequisites ----
echo "--- Phase 1: Checking prerequisites ---"

MISSING=false

check_cmd() {
  if command -v "$1" &>/dev/null; then
    echo "  [OK] $1"
  else
    echo "  [MISSING] $1"
    MISSING=true
  fi
}

check_cmd node
check_cmd git

# Try to install bun if missing
if ! command -v bun &>/dev/null; then
  echo "  [MISSING] bun - attempting install..."
  npm install -g bun 2>/dev/null && echo "  [OK] bun installed" || {
    echo "  [WARN] Could not auto-install bun. Run: npm install -g bun"
    MISSING=true
  }
else
  echo "  [OK] bun"
fi

if [ "$MISSING" = true ]; then
  echo ""
  echo "  Some prerequisites are missing. Install them first:"
  echo "    Node.js: https://nodejs.org"
  echo "    Git:     https://git-scm.com"
  echo "    bun:     npm install -g bun"
  exit 1
fi

# ---- Phase 2: Copy configs ----
echo ""
echo "--- Phase 2: Installing Claude Code configs ---"

mkdir -p "$CLAUDE_DIR"

if [ -f "$CLAUDE_DIR/settings.json" ]; then
  echo "  [SKIP] ~/.claude/settings.json already exists"
  echo ""
  echo "  Your existing file was NOT overwritten."
  echo "  The kit includes these hooks you may want to merge manually:"
  echo "    - Package manager gate (blocks npm/yarn, forces bun)"
  echo "    - Frontend build check (reminds to verify after .tsx/.css edits)"
  echo "    - Quality gate on stop (reminds to test/screenshot)"
  echo "  Compare: $SCRIPT_DIR/configs/settings.json"
else
  cp "$SCRIPT_DIR/configs/settings.json" "$CLAUDE_DIR/settings.json"
  echo "  [OK] Copied settings.json to ~/.claude/"
fi

echo ""
echo "  To use configs in a project, copy them manually:"
echo ""
echo "    # Copy project template"
echo "    cp $SCRIPT_DIR/configs/CLAUDE.md /your/project/"
echo ""
echo "    # Copy MCP server config (then fill in YOUR API KEYS)"
echo "    cp $SCRIPT_DIR/configs/mcp.json /your/project/.mcp.json"
echo ""
echo "    # IMPORTANT: Add .mcp.json to your .gitignore (it has API keys!)"
echo "    echo '.mcp.json' >> /your/project/.gitignore"
echo ""
echo "    # Copy coding rules"
echo "    mkdir -p /your/project/.claude/rules"
echo "    cp $SCRIPT_DIR/configs/rules/* /your/project/.claude/rules/"

# ---- Phase 3: Install Playwright ----
echo ""
echo "--- Phase 3: Installing Playwright browsers ---"
npx playwright install firefox chromium 2>/dev/null && echo "  [OK] Playwright browsers installed" || {
  echo "  [WARN] Playwright install failed."
  echo "  Try manually: npx playwright install firefox chromium"
  echo "  On Linux, you may need: npx playwright install --with-deps"
}

# ---- Phase 4: Enable plugins ----
echo ""
echo "--- Phase 4: Enabling plugins ---"

if command -v claude &>/dev/null; then
  for plugin in claude-code-setup frontend-design playwright agent-sdk-dev claude-md-management code-simplifier; do
    claude plugin enable "$plugin" 2>&1 && echo "  [OK] $plugin" || claude plugin enable "${plugin}@claude-plugins-official" 2>/dev/null && echo "  [OK] $plugin" || echo "  [WARN] Could not enable $plugin (install manually in Claude Code settings)"
  done
else
  echo "  [SKIP] Claude CLI not found."
  echo "  Install Claude Code first: npm install -g @anthropic-ai/claude-code"
  echo "  Then enable plugins manually in settings."
fi

# ---- Phase 5: Check for unfilled placeholders ----
echo ""
echo "--- Phase 5: Checking for unfilled API keys ---"

PLACEHOLDERS=$(grep -oE 'YOUR_[A-Z_]+' "$SCRIPT_DIR/configs/mcp.json" 2>/dev/null | sort -u)
if [ -n "$PLACEHOLDERS" ]; then
  echo "  These API keys need to be filled in configs/mcp.json:"
  echo "$PLACEHOLDERS" | while read key; do echo "    - $key"; done
  echo ""
  echo "  Get free keys at:"
  echo "    Brave Search:  https://brave.com/search/api"
  echo "    GitHub PAT:    https://github.com/settings/tokens"
  echo "    Exa:           https://exa.ai"
  echo "    Firecrawl:     https://firecrawl.dev"
  echo "    Supabase:      https://supabase.com"
  echo "    Sentry:        https://sentry.io"
fi

# ---- Done ----
echo ""
echo "--- Setup Complete ---"
echo ""
echo "  Next steps:"
echo "  1. Fill in API keys in configs/mcp.json"
echo "  2. Copy configs to your project (see Phase 2 above)"
echo "  3. Install skills from SKILLS.md"
echo "  4. Run: claude 'hello, summarize my setup'"
echo ""
echo "  Read TIPS.md for lessons from 200+ hours of usage."
echo ""
