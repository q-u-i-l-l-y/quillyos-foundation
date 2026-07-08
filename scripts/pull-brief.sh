#!/bin/bash
# ============================================================
# pull-brief — QUILLYOS SESSION HANDOFF PULL COMMAND
# 
# Usage: source pull-brief.sh
#        pull-brief          # Pull and display latest brief
#        pull-brief-clip     # Pull and copy to clipboard
#        pull-brief-kimi     # Pull brief formatted for Kimi ingestion
# ============================================================

# --- Configuration ---
REPO_URL="https://github.com/q-u-i-l-l-y/quillyos-foundation.git"
LOCAL_DIR="${HOME}/quillyos/quillyos-foundation"
BRIEF_DIR="${LOCAL_DIR}/session_briefs"
LATEST_FILE="${BRIEF_DIR}/LATEST.md"

# --- Function: pull-brief ---
function pull-brief() {
    echo "========================================"
    echo "  QUILLYOS SESSION HANDOFF"
    echo "  Pulling latest brief from GitHub..."
    echo "========================================"
    echo ""

    # Check dependencies
    if ! command -v git &> /dev/null; then
        echo "[ERROR] git is not installed. Run: pkg install git"
        return 1
    fi

    # Clone or pull
    if [ -d "${LOCAL_DIR}/.git" ]; then
        echo "[INFO] Repository exists. Pulling latest..."
        cd "${LOCAL_DIR}"
        git pull origin main
    else
        echo "[INFO] Cloning repository..."
        mkdir -p "$(dirname ${LOCAL_DIR})"
        git clone "${REPO_URL}" "${LOCAL_DIR}"
        cd "${LOCAL_DIR}"
    fi

    echo ""

    # Check for brief
    if [ ! -f "${LATEST_FILE}" ]; then
        echo "[WARN] No LATEST.md found."
        echo "[INFO] Available briefs:"
        ls -1t "${BRIEF_DIR}"/*.md 2>/dev/null || echo "  (none)"
        return 1
    fi

    # Display brief
    echo "[INFO] Latest session brief:"
    echo ""
    cat "${LATEST_FILE}"

    echo ""
    echo "========================================"
    echo "  HANDOFF COMPLETE"
    echo "========================================"
    echo ""
    echo "Next steps:"
    echo "  1. Review the brief above"
    echo "  2. Copy to clipboard: pull-brief-clip"
    echo "  3. Format for Kimi: pull-brief-kimi"
    echo "  4. Continue with recommended actions"
    echo ""
}

# --- Function: pull-brief-clip ---
function pull-brief-clip() {
    pull-brief > /dev/null 2>&1
    if [ -f "${LATEST_FILE}" ]; then
        if command -v termux-clipboard-set &> /dev/null; then
            cat "${LATEST_FILE}" | termux-clipboard-set
            echo "[✓] Brief copied to clipboard. Paste into Kimi."
        else
            echo "[WARN] termux-clipboard-set not found."
            echo "[INFO] Brief is at: ${LATEST_FILE}"
        fi
    fi
}

# --- Function: pull-brief-kimi ---
# Formats the brief for optimal Kimi ingestion
function pull-brief-kimi() {
    pull-brief > /dev/null 2>&1
    if [ -f "${LATEST_FILE}" ]; then
        echo "========================================"
        echo "  KIMI INGESTION FORMAT"
        echo "========================================"
        echo ""
        echo "Below is the latest QuillyOS session brief."
        echo "Use this context to continue from where the previous session left off."
        echo ""
        echo "--- BEGIN CONTEXT ---"
        echo ""
        # Extract key sections for Kimi
        grep -A 50 "## 2. MISSION CONTEXT" "${LATEST_FILE}" 2>/dev/null || echo "Mission context not found"
        echo ""
        grep -A 100 "## 3. WHAT WAS DONE" "${LATEST_FILE}" 2>/dev/null || echo "Progress section not found"
        echo ""
        grep -A 50 "## 7. NEXT SESSION PREP" "${LATEST_FILE}" 2>/dev/null || echo "Next steps not found"
        echo ""
        echo "--- END CONTEXT ---"
        echo ""
        echo "Full brief available at: ${LATEST_FILE}"
        echo "Repository: ${REPO_URL}"
    fi
}

# --- Function: qstatus ---
function qstatus() {
    cd "${LOCAL_DIR}" 2>/dev/null || return 1
    git status
}

# --- Function: qcd ---
function qcd() {
    cd "${LOCAL_DIR}"
    pwd
}

# --- Function: qprinciples ---
function qprinciples() {
    cat "${LOCAL_DIR}/principles/CORE_PRINCIPLES.md" 2>/dev/null || echo "Principles not found"
}

# --- Function: qroadmap ---
function qroadmap() {
    cat "${LOCAL_DIR}/roadmap/IMMEDIATE_MILESTONES.md" 2>/dev/null || echo "Roadmap not found"
}

# --- Function: qfoundation ---
function qfoundation() {
    cat "${LOCAL_DIR}/FOUNDATION.md" 2>/dev/null || echo "Foundation not found"
}

# --- Function: qagents ---
function qagents() {
    cat "${LOCAL_DIR}/governance/AGENT_SPECIALIZATION.md" 2>/dev/null || echo "Agent specs not found"
}

# --- Function: qontology ---
function qontology() {
    cat "${LOCAL_DIR}/ontology/CANONICAL_OBJECT_TYPES.md" 2>/dev/null || echo "Ontology not found"
}

# --- Function: qprotocol ---
function qprotocol() {
    cat "${LOCAL_DIR}/protocol/NEXUS_PROTOCOL_SPEC.md" 2>/dev/null || echo "Protocol spec not found"
}

# --- Function: qhandoff ---
function qhandoff() {
    cat "${LOCAL_DIR}/protocol/SESSION_HANDOFF.md" 2>/dev/null || echo "Handoff spec not found"
}

# --- Function: push-brief ---
function push-brief() {
    local summary="${1:-Session ended}"
    local agent_role="${2:-picoclaw}"

    cd "${LOCAL_DIR}" 2>/dev/null || {
        echo "[ERROR] Cannot access ${LOCAL_DIR}"
        return 1
    }

    bash scripts/push_brief.sh "${summary}" "${agent_role}"
}

echo ""
echo "========================================"
echo "  QUILLYOS COMMANDS LOADED"
echo "========================================"
echo ""
echo "Available commands:"
echo "  pull-brief          — Pull and display latest brief"
echo "  pull-brief-clip     — Pull brief and copy to clipboard"
echo "  pull-brief-kimi     — Format brief for Kimi ingestion"
echo "  push-brief "text"  — Push a new session brief"
echo "  qstatus             — Check git status"
echo "  qcd                 — Navigate to foundation repo"
echo "  qprinciples         — Display core principles"
echo "  qroadmap            — Display current roadmap"
echo "  qfoundation         — Display FOUNDATION.md"
echo "  qagents             — Display agent specializations"
echo "  qontology           — Display canonical object types"
echo "  qprotocol           — Display Nexus Protocol spec"
echo "  qhandoff            — Display handoff mechanism"
echo ""
echo "Add to ~/.bashrc: source /path/to/pull-brief.sh"
echo ""
