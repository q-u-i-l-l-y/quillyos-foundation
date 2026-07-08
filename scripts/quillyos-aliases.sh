# =============================================================================
# QUILLYOS AGENT SUITE — Shell Aliases v1.1
# Install: source ~/.quillyos/quillyos-aliases.sh
# =============================================================================

quillyos() {
    bash "$HOME/.quillyos/quillyos-agent-suite.sh" "$@"
}

# Legacy handoff aliases
alias pull-brief='quillyos pull-brief'
alias pull-brief-clip='quillyos pull-brief-clip'
alias pull-brief-kimi='quillyos pull-brief-kimi'
alias push-brief='quillyos push-brief'

# Agentic aliases
alias session='quillyos session'
alias insight='quillyos insight'

# PicoClaw bridge aliases (corrected)
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
