#!/usr/bin/env bash
set -e

# ============================================
# Claude Code Powerkit — Setup Script
# ============================================
# Terminal alternative to the BOOTSTRAP.md paste method.
# Run in: macOS Terminal, Linux shell, Git Bash, or WSL
# NOT supported: Windows PowerShell or CMD — use Git Bash instead.
#
# ⚠ PARTIAL INSTALL — this script installs skills, settings, and CLAUDE.md.
# It does NOT install:
#   - 70 subagents (18 VoltAgent + 52 developer specialists)
#   - 24 Composio community skills
#
# For the full install (recommended), paste this URL into Claude Code instead:
#   https://raw.githubusercontent.com/Neens6655/claude-code-powerkit/master/BOOTSTRAP.md

echo ""
echo "  Claude Code Powerkit"
echo "  Setup Script"
echo "  ──────────────────────────────────────"
echo ""

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_DIR="$HOME/.claude"
MISSING_REQUIRED=false
MISSING_OPTIONAL=false

# ── Phase 1: Required prerequisites ──────────────────────────────────────────
echo "Phase 1: Checking required prerequisites"
echo ""

check_required() {
  if command -v "$1" &>/dev/null; then
    printf "  ✓ %-12s %s\n" "$1" "$(${1} --version 2>&1 | head -1)"
  else
    printf "  ✗ %-12s MISSING\n" "$1"
    MISSING_REQUIRED=true
  fi
}

check_optional() {
  if command -v "$1" &>/dev/null; then
    printf "  ✓ %-12s %s\n" "$1" "$(${1} --version 2>&1 | head -1)"
  else
    printf "  - %-12s not installed (optional)\n" "$1"
    MISSING_OPTIONAL=true
  fi
}

check_required node
check_required npx
check_required git

echo ""
echo "  Optional tools:"
check_optional bun
check_optional gh
check_optional python3
check_optional ffmpeg

if [ "$MISSING_REQUIRED" = true ]; then
  echo ""
  echo "  ✗ Required tools are missing. Install them first:"
  echo ""
  echo "  macOS:"
  echo "    brew install node git"
  echo ""
  echo "  Windows (PowerShell as Admin):"
  echo "    winget install OpenJS.NodeJS.LTS"
  echo "    winget install Git.Git"
  echo ""
  echo "  Linux (Ubuntu/Debian):"
  echo "    curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -"
  echo "    sudo apt-get install -y nodejs git"
  echo ""
  echo "  Then re-run this script."
  exit 1
fi

# Install bun if missing (it's recommended)
if ! command -v bun &>/dev/null; then
  echo ""
  echo "  Installing bun (recommended package manager)..."
  curl -fsSL https://bun.sh/install | bash 2>/dev/null && echo "  ✓ bun installed" || {
    echo "  ⚠ Could not auto-install bun."
    echo "    macOS/Linux: curl -fsSL https://bun.sh/install | bash"
    echo "    Windows:     winget install Oven-sh.Bun"
  }
fi

# ── Phase 2: Install Playwright browsers ─────────────────────────────────────
echo ""
echo "Phase 2: Installing Playwright browsers (needed for screenshot tools)"
echo ""

npx --yes playwright install chromium 2>/dev/null && echo "  ✓ Chromium installed" || {
  echo "  ⚠ Playwright browser install failed."
  echo "    Try: npx playwright install chromium"
  echo "    Linux only: npx playwright install --with-deps chromium"
}

# ── Phase 3: Copy Claude Code settings ───────────────────────────────────────
echo ""
echo "Phase 3: Installing Claude Code settings"
echo ""

mkdir -p "$CLAUDE_DIR"

if [ -f "$CLAUDE_DIR/settings.json" ]; then
  echo "  ⚠ ~/.claude/settings.json already exists — skipping to avoid overwrite."
  echo "    Compare with $SCRIPT_DIR/configs/settings.json and merge manually if needed."
else
  cp "$SCRIPT_DIR/configs/settings.json" "$CLAUDE_DIR/settings.json"
  echo "  ✓ settings.json → ~/.claude/settings.json"
fi

# ── Phase 4: Install skills ───────────────────────────────────────────────────
echo ""
echo "Phase 4: Installing curated skills to ~/.claude/skills/"
echo ""

SKILLS_DIR="$CLAUDE_DIR/skills"
mkdir -p "$SKILLS_DIR"

SKILLS=(
  "sensei" "design" "plato" "autopilot" "prd" "architect" "kickoff"
  "app-builder" "iterate" "fix" "explain" "vibe-code-auditor"
  "feedback-loop" "dispatching-parallel-agents" "micro-saas-launcher"
  "marketing-psychology" "react-best-practices" "tailwind-patterns"
  "typescript-expert" "baoyu-image-gen" "baoyu-infographic"
  "canvas-design" "data-storytelling" "loki-mode" "mcp-builder"
  "cheap-route" "beautiful-prose" "video-forge" "algorithmic-art"
  "scroll-experience"
)

REPO_RAW="https://raw.githubusercontent.com/Neens6655/claude-code-powerkit/master/skills"

for skill in "${SKILLS[@]}"; do
  target_dir="$SKILLS_DIR/$skill"
  mkdir -p "$target_dir"
  if curl -fsSL "$REPO_RAW/${skill}.md" -o "$target_dir/SKILL.md" 2>/dev/null; then
    echo "  ✓ /$skill"
  else
    echo "  ✗ /$skill — failed to fetch"
  fi
done

# ── Phase 5: Write global CLAUDE.md ──────────────────────────────────────────
echo ""
echo "Phase 5: Writing global CLAUDE.md"
echo ""

GLOBAL_CLAUDE="$CLAUDE_DIR/CLAUDE.md"

if [ -f "$GLOBAL_CLAUDE" ] && [ -s "$GLOBAL_CLAUDE" ]; then
  echo "  ⚠ ~/.claude/CLAUDE.md already exists — skipping."
  echo "    Check $SCRIPT_DIR/configs/CLAUDE.md for settings to merge."
else
  cp "$SCRIPT_DIR/configs/CLAUDE.md" "$GLOBAL_CLAUDE"
  echo "  ✓ CLAUDE.md → ~/.claude/CLAUDE.md"
fi

# ── Phase 6: Report ───────────────────────────────────────────────────────────
echo ""
echo "  ──────────────────────────────────────────────────"
echo "  ✅  CLAUDE CODE POWERKIT — SETUP COMPLETE"
echo "  ──────────────────────────────────────────────────"
echo ""
echo "  Installed (partial — terminal path):"
echo "    ✓ Playwright browser (screenshots work now)"
echo "    ✓ 30 curated skills in ~/.claude/skills/"
echo "    ✓ Claude Code settings + npm/yarn block hook"
echo "    ✓ Global CLAUDE.md"
echo ""
echo "  NOT installed by this script:"
echo "    ✗ 70 subagents (VoltAgent + developer specialists)"
echo "    ✗ 24 Composio community skills"
echo "    → For the full install, paste the BOOTSTRAP.md URL into Claude Code instead"
echo ""
echo "  Next: copy MCP config to Claude Desktop"
echo ""
echo "    macOS:   cp $SCRIPT_DIR/configs/mcp.json"
echo "             ~/Library/Application Support/Claude/claude_desktop_config.json"
echo "    Windows: copy to %APPDATA%\\Claude\\claude_desktop_config.json"
echo "    Then replace YOUR_*_KEY placeholders with real keys."
echo ""
echo "  API keys — get these first (free, 5 min each):"
echo "    Brave Search  → https://api.search.brave.com       (2,000/mo free)"
echo "    GitHub        → https://github.com/settings/tokens  (free)"
echo ""
echo "  Add when needed:"
echo "    OpenRouter    → https://openrouter.ai/keys          (100+ LLMs incl. Gemini)"
echo "    Firecrawl     → https://firecrawl.dev"
echo "    Perplexity    → https://perplexity.ai/settings/api"
echo "    Replicate     → https://replicate.com/account/api-tokens"
echo ""
echo "  Start here [BEGINNER]:"
echo "    /prd                 — write requirements for an idea"
echo "    /design              — generate UI with the design system"
echo "    /plato quick [idea]  — 3-advisor feedback in 2 min"
echo ""
echo "  When ready to build:"
echo "    /kickoff             — architect + build + review"
echo "    /sensei              — learn CS while building"
echo ""
