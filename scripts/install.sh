#!/bin/bash
# ============================================================
# QUILLYOS FOUNDATION — ONE-LINE INSTALLER FOR TERMUX
# 
# Usage: bash -c "$(curl -fsSL https://raw.githubusercontent.com/q-u-i-l-l-y/quillyos-foundation/main/scripts/install.sh)"
# ============================================================

set -e

REPO_URL="https://github.com/q-u-i-l-l-y/quillyos-foundation.git"
INSTALL_DIR="${HOME}/quillyos"
REPO_DIR="${INSTALL_DIR}/quillyos-foundation"

echo "========================================"
echo "  QUILLYOS FOUNDATION INSTALLER"
echo "========================================"
echo ""

# --- Check Termux ---
if [ -z "${TERMUX_VERSION}" ] && [ ! -d "/data/data/com.termux" ]; then
    echo "[WARN] Not running in Termux. Continuing anyway..."
fi

# --- Install dependencies ---
echo "[1/6] Checking dependencies..."
if ! command -v git &> /dev/null; then
    echo "[INFO] Installing git..."
    pkg update -y
    pkg install -y git
else
    echo "[✓] git is installed"
fi

if ! command -v python &> /dev/null && ! command -v python3 &> /dev/null; then
    echo "[INFO] Installing python..."
    pkg install -y python
else
    echo "[✓] python is installed"
fi

# --- Configure git ---
echo ""
echo "[2/6] Configuring git..."
if [ -z "$(git config --global user.name 2>/dev/null)" ]; then
    git config --global user.name "QuillyOS Steward"
fi
if [ -z "$(git config --global user.email 2>/dev/null)" ]; then
    git config --global user.email "steward@quillyos.local"
fi
git config --global init.defaultBranch main
echo "[✓] Git configured"

# --- Create workspace ---
echo ""
echo "[3/6] Creating workspace..."
mkdir -p "${INSTALL_DIR}"
echo "[✓] Workspace: ${INSTALL_DIR}"

# --- Clone repository ---
echo ""
echo "[4/6] Cloning quillyos-foundation..."
if [ -d "${REPO_DIR}/.git" ]; then
    echo "[INFO] Repository exists. Pulling latest..."
    cd "${REPO_DIR}"
    git pull origin main
else
    echo "[INFO] Cloning fresh..."
    git clone "${REPO_URL}" "${REPO_DIR}"
    cd "${REPO_DIR}"
fi
echo "[✓] Repository ready at: ${REPO_DIR}"

# --- Install pull-brief command suite ---
echo ""
echo "[5/6] Installing pull-brief command suite..."
PULL_BRIEF_SOURCE="${REPO_DIR}/scripts/pull-brief.sh"
PULL_BRIEF_TARGET="${HOME}/.quillyos/pull-brief.sh"

if [ -f "${PULL_BRIEF_SOURCE}" ]; then
    mkdir -p "$(dirname ${PULL_BRIEF_TARGET})"
    cp "${PULL_BRIEF_SOURCE}" "${PULL_BRIEF_TARGET}"
    chmod +x "${PULL_BRIEF_TARGET}"
    echo "[✓] pull-brief.sh installed to ${PULL_BRIEF_TARGET}"
else
    echo "[WARN] pull-brief.sh not found in repo. Will be available after next pull."
fi

# --- Add aliases to ~/.bashrc ---
echo ""
echo "[6/6] Configuring shell aliases..."
BASHRC="${HOME}/.bashrc"
ALIAS_MARKER="# === QUILLYOS ALIASES ==="

if ! grep -q "${ALIAS_MARKER}" "${BASHRC}" 2>/dev/null; then
    cat >> "${BASHRC}" << 'EOF'

# === QUILLYOS ALIASES ===
# Source the pull-brief command suite
if [ -f "${HOME}/.quillyos/pull-brief.sh" ]; then
    source "${HOME}/.quillyos/pull-brief.sh"
fi

# Quick navigation
alias qcd='cd ${HOME}/quillyos/quillyos-foundation && pwd'

# Quick reference
alias qfoundation='cat ${HOME}/quillyos/quillyos-foundation/FOUNDATION.md 2>/dev/null || echo "Foundation not found"'
alias qroadmap='cat ${HOME}/quillyos/quillyos-foundation/roadmap/IMMEDIATE_MILESTONES.md 2>/dev/null || echo "Roadmap not found"'
alias qprinciples='cat ${HOME}/quillyos/quillyos-foundation/principles/CORE_PRINCIPLES.md 2>/dev/null || echo "Principles not found"'

# === END QUILLYOS ALIASES ===
EOF
    echo "[✓] Aliases added to ${BASHRC}"
else
    echo "[✓] Aliases already configured"
fi

# --- Done ---
echo ""
echo "========================================"
echo "  INSTALLATION COMPLETE"
echo "========================================"
echo ""
echo "Workspace: ${INSTALL_DIR}"
echo "Repository: ${REPO_DIR}"
echo ""
echo "To activate aliases, run:"
echo "  source ~/.bashrc"
echo ""
echo "Then use these commands:"
echo "  pull-brief          — Pull latest session brief"
echo "  pull-brief-clip     — Copy brief to clipboard"
echo "  pull-brief-kimi     — Format for Kimi ingestion"
echo "  qcd                 — Navigate to foundation repo"
echo "  qfoundation         — Display FOUNDATION.md"
echo "  qroadmap            — Display roadmap"
echo "  qprinciples         — Display principles"
echo ""
echo "To push a session brief:"
echo "  cd ${REPO_DIR} && bash scripts/push_brief.sh "Your summary""
echo ""
echo "Build for decades. Not versions. 🚀"
