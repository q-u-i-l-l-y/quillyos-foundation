#!/data/data/com.termux/files/usr/bin/bash
# =============================================================================
# QUILLYOS BASHRC FIX v1.2
# Run this to clean old aliases and install new ones
# =============================================================================

BASHRC="$HOME/.bashrc"
SUITE_DIR="$HOME/.quillyos"

echo "[1/4] Backing up .bashrc..."
cp "$BASHRC" "$BASHRC.backup.$(date +%s)"

echo "[2/4] Removing old QuillyOS references..."
# Remove old pull-brief.sh source lines
sed -i '/pull-brief.sh/d' "$BASHRC"
# Remove old quillyos agent suite lines  
sed -i '/quillyos-agent-suite/d' "$BASHRC"
sed -i '/quillyos-aliases/d' "$BASHRC"
# Remove old "QuillyOS commands loaded" blocks
sed -i '/QUILLYOS COMMANDS LOADED/,/^$/d' "$BASHRC"
sed -i '/QUILLYOS AGENT SUITE/d' "$BASHRC"

echo "[3/4] Adding new QuillyOS Agent Suite..."
cat >> "$BASHRC" << 'EOF'

# =============================================================================
# QUILLYOS AGENT SUITE v1.2
# =============================================================================
source $HOME/.quillyos/quillyos-aliases.sh
EOF

echo "[4/4] Reloading shell..."
source "$BASHRC"

echo ""
echo "========================================"
echo "  BASHRC FIXED"
echo "========================================"
echo ""
echo "Test these commands:"
echo "  session status"
echo "  insight list"
echo "  q"
echo ""
echo "If they fail, run: source ~/.bashrc"
