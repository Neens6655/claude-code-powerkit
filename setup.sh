#!/usr/bin/env bash
set -e

# ============================================
# Ziad StarterKit — Claude Code Setup Script
# ============================================

echo ""
echo "  ╔═══════════════════════════════════╗"
echo "  ║     Ziad StarterKit               ║"
echo "  ║     Claude Code Setup             ║"
echo "  ╚═══════════════════════════════════╝"
echo ""

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_DIR="$HOME/.claude"

# ---- Phase 1: Prerequisites ----
echo "--- Phase 1: Checking prerequisites ---"

check_cmd() {
  if command -v "$1" &>/dev/null; then
    echo "  [OK] $1"
  else
    echo "  [MISSING] $1 — install it first (see README.md)"
    MISSING=true
  fi
}

MISSING=false
check_cmd node
check_cmd git
check_cmd bun || {
  echo "  Installing bun..."
  npm install -g bun 2>/dev/null || echo "  [WARN] Could not install bun automatically. Run: npm install -g bun"
}

if [ "$MISSING" = true ]; then
  echo ""
  echo "Some prerequisites are missing. Install them and re-run this script."
  echo "See README.md for install commands."
  exit 1
fi

# ---- Phase 2: Copy configs ----
echo ""
echo "--- Phase 2: Installing configs ---"

# Settings
mkdir -p "$CLAUDE_DIR"
if [ -f "$CLAUDE_DIR/settings.json" ]; then
  echo "  [SKIP] ~/.claude/settings.json already exists (not overwriting)"
  echo "         Compare with: $SCRIPT_DIR/configs/settings.json"
else
  cp "$SCRIPT_DIR/configs/settings.json" "$CLAUDE_DIR/settings.json"
  echo "  [OK] Copied settings.json to ~/.claude/"
fi

# CLAUDE.md — only copy if user is in a project directory
echo ""
echo "  Config files are ready in: $SCRIPT_DIR/configs/"
echo "  To use them in a project, copy manually:"
echo ""
echo "    cp $SCRIPT_DIR/configs/CLAUDE.md /path/to/your/project/"
echo "    cp $SCRIPT_DIR/configs/mcp.json /path/to/your/project/.mcp.json"
echo "    mkdir -p /path/to/your/project/.claude/rules"
echo "    cp $SCRIPT_DIR/configs/rules/* /path/to/your/project/.claude/rules/"

# ---- Phase 3: Install Playwright ----
echo ""
echo "--- Phase 3: Installing Playwright browsers ---"
npx playwright install firefox chromium 2>/dev/null || echo "  [WARN] Playwright install failed. Run manually: npx playwright install firefox chromium"

# ---- Phase 4: Enable plugins ----
echo ""
echo "--- Phase 4: Enabling plugins ---"

enable_plugin() {
  echo "  Enabling $1..."
  claude plugin enable "$1" 2>/dev/null || echo "  [WARN] Could not enable $1 — enable manually in Claude Code"
}

if command -v claude &>/dev/null; then
  enable_plugin claude-code-setup
  enable_plugin frontend-design
  enable_plugin playwright
  enable_plugin agent-sdk-dev
  enable_plugin claude-md-management
  enable_plugin code-simplifier
else
  echo "  [SKIP] Claude CLI not found. Enable plugins manually after installing Claude Code."
fi

# ---- Phase 5: Summary ----
echo ""
echo "--- Setup Complete ---"
echo ""
echo "  Next steps:"
echo ""
echo "  1. Get your API keys (all free tier):"
echo "     - Brave Search: brave.com/search/api"
echo "     - GitHub PAT:   github.com/settings/tokens"
echo "     - Exa:          exa.ai"
echo "     - Firecrawl:    firecrawl.dev"
echo ""
echo "  2. Edit your .mcp.json and replace YOUR_* placeholders with real keys"
echo ""
echo "  3. Install skills (see SKILLS.md for the full catalog):"
echo "     git clone https://github.com/anthropics/skills.git /tmp/skills"
echo "     claude skill add /tmp/skills/path/to/SKILL.md"
echo ""
echo "  4. Open a project and run:"
echo "     claude \"hello, summarize my setup\""
echo ""
echo "  Read TIPS.md for pro tips from 200+ hours of usage."
echo ""
