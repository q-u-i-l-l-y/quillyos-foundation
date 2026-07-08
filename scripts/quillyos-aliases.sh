#!/data/data/com.termux/files/usr/bin/bash
# =============================================================================
# QUILLYOS AGENT SUITE — Shell Aliases v1.2 (FIXED)
# This file replaces ALL previous QuillyOS alias definitions
# =============================================================================

# --- REMOVE OLD REFERENCES (idempotent) ---
# These lines prevent conflicts with old pull-brief.sh installations

# Main dispatcher function
quillyos() {
    bash "$HOME/.quillyos/quillyos-agent-suite.sh" "$@"
}

# Legacy handoff aliases (backward compatible)
alias pull-brief='quillyos pull-brief'
alias pull-brief-clip='quillyos pull-brief-clip'
alias pull-brief-kimi='quillyos pull-brief-kimi'
alias push-brief='quillyos push-brief'

# NEW: Agentic aliases (plain language)
alias session='quillyos session'
alias insight='quillyos insight'

# NEW: PicoClaw bridge aliases (corrected for Sipeed)
alias picoclaw-status='quillyos picoclaw-status'
alias picoclaw-agent='quillyos picoclaw-agent'
alias picoclaw-config='quillyos picoclaw-config'

# Quick reference aliases
alias qstatus='quillyos qstatus'
alias qcd='quillyos qcd'
alias qfoundation='quillyos qfoundation'
alias qroadmap='quillyos qroadmap'
alias qprinciples='quillyos qprinciples'
alias qagents='quillyos qagents'
alias qontology='quillyos qontology'
alias qprotocol='quillyos qprotocol'
alias qhandoff='quillyos qhandoff'
alias qvision='quillyos qvision'

# Quick status
alias q='quillyos session status'

# =============================================================================
# POST-LOAD VERIFICATION
# =============================================================================
echo "========================================"
echo "  QUILLYOS AGENT SUITE v1.2 LOADED"
echo "========================================"
echo ""
echo "Agentic commands:"
echo "  session push \"text\"    — Record session"
echo "  session status          — Show state"
echo "  session log             — List history"
echo "  session sync            — Sync with GitHub"
echo "  insight add \"text\"     — Record insight"
echo "  insight list            — Show pending"
echo ""
echo "PicoClaw bridge:"
echo "  picoclaw-status         — Check daemon/LLM"
echo "  picoclaw-agent          — Start interactive"
echo "  picoclaw-config         — Show config"
echo ""
echo "Quick status: q"
echo ""
