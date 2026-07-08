#!/bin/bash
# ============================================================
# QUILLYOS SESSION HANDOFF — PULL SCRIPT
# For Termux / PicoClaw / Linux environments
# ============================================================

set -e

REPO_URL="https://github.com/q-u-i-l-l-y/quillyos-foundation.git"
LOCAL_DIR="$HOME/quillyos-foundation"
BRIEF_DIR="$LOCAL_DIR/session_briefs"
LATEST_FILE="$BRIEF_DIR/LATEST.md"

echo "========================================"
echo "  QUILLYOS SESSION HANDOFF"
echo "  Pull latest session brief"
echo "========================================"
echo ""

# --- Check dependencies ---
if ! command -v git &> /dev/null; then
    echo "[ERROR] git is not installed. Install with: pkg install git"
    exit 1
fi

# --- Clone or pull ---
if [ -d "$LOCAL_DIR/.git" ]; then
    echo "[INFO] Repository exists. Pulling latest..."
    cd "$LOCAL_DIR"
    git pull origin main
else
    echo "[INFO] Cloning repository..."
    git clone "$REPO_URL" "$LOCAL_DIR"
    cd "$LOCAL_DIR"
fi

echo ""

# --- Check for briefs ---
if [ ! -f "$LATEST_FILE" ]; then
    echo "[WARN] No LATEST.md found in session_briefs/"
    echo "[INFO] Available briefs:"
    ls -1t "$BRIEF_DIR"/*.md 2>/dev/null || echo "  (none)"
    echo ""
    echo "[INFO] This may be the first session. No handoff needed."
    exit 0
fi

# --- Display the brief ---
echo "[INFO] Latest session brief found:"
echo ""
cat "$LATEST_FILE"

echo ""
echo "========================================"
echo "  HANDOFF COMPLETE"
echo "========================================"
echo ""
echo "Next steps:"
echo "  1. Review the brief above"
echo "  2. Load referenced context matrices"
echo "  3. Continue with recommended actions"
echo ""

# --- Optional: Copy to clipboard (Termux) ---
if command -v termux-clipboard-set &> /dev/null; then
    cat "$LATEST_FILE" | termux-clipboard-set
    echo "[INFO] Brief copied to clipboard."
fi

# --- Optional: Generate context package for agent ---
if [ -f "$LOCAL_DIR/scripts/generate_context.sh" ]; then
    echo "[INFO] Generating agent context package..."
    bash "$LOCAL_DIR/scripts/generate_context.sh" "$LATEST_FILE"
fi

echo ""
echo "Ready to continue."
