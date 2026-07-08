#!/data/data/com.termux/files/usr/bin/bash
# =============================================================================
# QUILLYOS FOUNDATION INSTALLER v2.0
# Installs: workspace, repo, pull-brief suite, agent suite
# =============================================================================

echo "========================================"
echo "  QUILLYOS FOUNDATION INSTALLER v2.0"
echo "========================================"
echo ""

# --- [1/7] Dependencies ---
echo "[1/7] Checking dependencies..."
for cmd in git python curl; do
    if command -v $cmd &> /dev/null; then
        echo "  [✓] $cmd is installed"
    else
        echo "  [✗] $cmd is NOT installed"
        echo "  Run: pkg install $cmd"
        exit 1
    fi
done
echo ""

# --- [2/7] Git Config ---
echo "[2/7] Configuring git..."
if [ -z "$(git config --global user.name 2>/dev/null)" ]; then
    git config --global user.name "picoclaw-termux"
fi
if [ -z "$(git config --global user.email 2>/dev/null)" ]; then
    git config --global user.email "picoclaw@quillyos.local"
fi
echo "  [✓] Git configured"
echo ""

# --- [3/7] Workspace ---
echo "[3/7] Creating workspace..."
WORKSPACE="$HOME/quillyos"
mkdir -p "$WORKSPACE"
echo "  [✓] Workspace: $WORKSPACE"
echo ""

# --- [4/7] Clone Repo ---
echo "[4/7] Cloning quillyos-foundation..."
REPO_DIR="$WORKSPACE/quillyos-foundation"
if [ -d "$REPO_DIR/.git" ]; then
    echo "  [INFO] Repository exists. Pulling latest..."
    cd "$REPO_DIR"
    git pull origin main
else
    echo "  [INFO] Cloning fresh..."
    git clone https://github.com/q-u-i-l-l-y/quillyos-foundation.git "$REPO_DIR"
fi
echo "  [✓] Repository ready at: $REPO_DIR"
echo ""

# --- [5/7] Install Agent Suite ---
echo "[5/7] Installing QuillyOS Agent Suite..."
SUITE_DIR="$HOME/.quillyos"
mkdir -p "$SUITE_DIR"

# Install main suite
cp "$REPO_DIR/scripts/quillyos-agent-suite.sh" "$SUITE_DIR/quillyos-agent-suite.sh"
chmod +x "$SUITE_DIR/quillyos-agent-suite.sh"
echo "  [✓] Agent suite installed"

# Install aliases
cp "$REPO_DIR/scripts/quillyos-aliases.sh" "$SUITE_DIR/quillyos-aliases.sh"
echo "  [✓] Alias definitions installed"
echo ""

# --- [6/7] Configure Shell ---
echo "[6/7] Configuring shell aliases..."
BASHRC="$HOME/.bashrc"

# Remove old pull-brief references
sed -i '/pull-brief.sh/d' "$BASHRC" 2>/dev/null
sed -i '/quillyos-agent-suite/d' "$BASHRC" 2>/dev/null
sed -i '/quillyos-aliases/d' "$BASHRC" 2>/dev/null

# Add new source line
echo "" >> "$BASHRC"
echo "# QuillyOS Agent Suite" >> "$BASHRC"
echo "source $SUITE_DIR/quillyos-aliases.sh" >> "$BASHRC"

echo "  [✓] Aliases added to $BASHRC"
echo ""

# --- [7/7] Configure Git Remote with PAT ---
echo "[7/7] Configuring GitHub credentials..."
cd "$REPO_DIR"

# Check if remote already has token
CURRENT_URL=$(git remote get-url origin 2>/dev/null || echo "")
if echo "$CURRENT_URL" | grep -q "@github.com"; then
    echo "  [✓] Remote already configured with credentials"
else
    echo "  [INFO] Please configure your GitHub PAT:"
    echo "    git remote set-url origin https://q-u-i-l-l-y:YOUR_TOKEN@github.com/q-u-i-l-l-y/quillyos-foundation.git"
    echo ""
    echo "  Or run the installer with a token:"
    echo "    QUILLYOS_TOKEN=ghp_xxx bash install.sh"
fi
echo ""

# --- COMPLETE ---
echo "========================================"
echo "  INSTALLATION COMPLETE"
echo "========================================"
echo ""
echo "Workspace: $WORKSPACE"
echo "Repository: $REPO_DIR"
echo "Agent Suite: $SUITE_DIR"
echo ""
echo "To activate aliases, run:"
echo "  source ~/.bashrc"
echo ""
echo "Then use these commands:"
echo ""
echo "  SESSION HANDOFF:"
echo "    pull-brief              — Pull latest session brief"
echo "    pull-brief-clip         — Copy brief to clipboard"
echo "    pull-brief-kimi         — Format for Kimi ingestion"
echo "    push-brief \"text\"      — Push session brief"
echo ""
echo "  AGENTIC COMMANDS:"
echo "    session push \"text\"    — Record session (plain language)"
echo "    session status          — Show session state"
echo "    session log             — List session history"
echo "    session sync            — Sync with GitHub"
echo "    insight add \"text\"     — Record insight"
echo "    insight list            — Show pending insights"
echo ""
echo "  PICOCLAW BRIDGE:"
echo "    picoclaw-status         — Check PicoClaw daemon"
echo "    picoclaw-chat \"text\"   — Message PicoClaw agent"
echo ""
echo "  QUICK REFERENCE:"
echo "    qcd                     — Navigate to foundation repo"
echo "    qstatus                 — Check git status"
echo "    qfoundation             — Display FOUNDATION.md"
echo "    qroadmap                — Display roadmap"
echo "    qprinciples             — Display principles"
echo "    qagents                 — Display agent roles"
echo "    qontology               — Display object types"
echo "    qprotocol               — Display Nexus Protocol"
echo "    qhandoff                — Display handoff mechanism"
echo ""
echo "  QUICK STATUS:"
echo "    q                       — One-line session status"
echo ""
echo "Build for decades. Not versions. 🚀"
