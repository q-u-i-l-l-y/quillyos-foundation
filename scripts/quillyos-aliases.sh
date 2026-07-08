# =============================================================================
# QUILLYOS AGENT SUITE — Shell Aliases
# Install: Add 'source ~/.quillyos/quillyos-agent-suite.sh' to ~/.bashrc
# Or: Copy this block into ~/.bashrc directly
# =============================================================================

# Main dispatcher
quillyos() {
    bash "$HOME/.quillyos/quillyos-agent-suite.sh" "$@"
}

# Legacy handoff aliases (backward compatible)
alias pull-brief='quillyos pull-brief'
alias pull-brief-clip='quillyos pull-brief-clip'
alias pull-brief-kimi='quillyos pull-brief-kimi'
alias push-brief='quillyos push-brief'

# New agentic aliases (plain language)
alias session='quillyos session'
alias insight='quillyos insight'

# PicoClaw bridge aliases
alias picoclaw-status='quillyos picoclaw-status'
alias picoclaw-chat='quillyos picoclaw-chat'

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

# Convenience: type 'q' for quick status
alias q='quillyos session status'
