#!/data/data/com.termux/files/usr/bin/bash
# =============================================================================
# QUILLYOS BASHRC EMERGENCY REPAIR
# Fixes syntax errors introduced by previous fix script
# =============================================================================

BASHRC="$HOME/.bashrc"
SUITE_DIR="$HOME/.quillyos"

echo "[1/3] Creating clean .bashrc from backup or scratch..."

if [ -f "$BASHRC.backup"* ]; then
    LATEST_BACKUP=$(ls -t "$BASHRC.backup"* 2>/dev/null | head -1)
    echo "  Restoring from: $LATEST_BACKUP"
    cp "$LATEST_BACKUP" "$BASHRC"
else
    echo "  No backup found. Creating minimal .bashrc..."
    cat > "$BASHRC" << 'BASHEOF'
# ~/.bashrc - Termux default

# Enable colors
alias ls='ls --color=auto'
alias ll='ls -la'

# Custom paths
export PATH="$HOME/.local/bin:$PATH"
BASHEOF
fi

echo "[2/3] Removing ALL QuillyOS references cleanly..."
# Use grep to filter out lines, preserving valid bash syntax
grep -v "quillyos" "$BASHRC" > "$BASHRC.tmp" 2>/dev/null || cp "$BASHRC" "$BASHRC.tmp"
grep -v "pull-brief" "$BASHRC.tmp" > "$BASHRC.clean" 2>/dev/null || cp "$BASHRC.tmp" "$BASHRC.clean"
grep -v "QUTILLYOS" "$BASHRC.clean" > "$BASHRC" 2>/dev/null || cp "$BASHRC.clean" "$BASHRC"
rm -f "$BASHRC.tmp" "$BASHRC.clean"

echo "[3/3] Adding QuillyOS Agent Suite cleanly..."
cat >> "$BASHRC" << 'EOF'

# QuillyOS Agent Suite
export QUILLYOS_HOME="$HOME/quillyos"
source "$HOME/.quillyos/quillyos-aliases.sh" 2>/dev/null || true
EOF

echo ""
echo "========================================"
echo "  BASHRC REPAIRED"
echo "========================================"
echo ""
echo "Testing syntax..."
bash -n "$BASHRC"
if [ $? -eq 0 ]; then
    echo "✓ Syntax valid"
    echo ""
    echo "Reload with: source ~/.bashrc"
else
    echo "✗ Syntax still broken. Check: cat ~/.bashrc"
fi
