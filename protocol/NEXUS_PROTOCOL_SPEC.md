# NEXUS PROTOCOL SPECIFICATION
## Version 1.0 — Living Document

---

## 1. PURPOSE

The Nexus Protocol defines the language that every repository, every agent, every workflow, and every future hardware node speaks.

If you get this right, GPT, Kimi, PicoClaw, Manus, n8n, Raspberry Pi clusters, and future devices won't just exchange files — they'll share a **common model of the project**.

---

## 2. CORE CONCEPTS

### 2.1 Shared Representation Over Shared Memory

Instead of passing chat histories between AI systems, every participant communicates through structured context packages. The protocol provides a shared representation of reality that is:

- **Model-agnostic** — Any LLM or agent can parse it
- **Versioned** — Every change is tracked
- **Cross-referenced** — Every claim links to evidence
- **Actionable** — Every package contains clear next steps

### 2.2 The Context Matrix

The central data structure of the Nexus Protocol is the **Context Matrix** — a structured document that represents the current state of a domain, project, or mission.

---

## 3. CONTEXT MATRIX FORMAT

Every Context Matrix is a YAML file with the following mandatory sections:

```yaml
nexus_version: "1.0"
matrix_id: "unique-identifier"
created: "2026-07-08T00:00:00Z"
updated: "2026-07-08T00:00:00Z"
author: "agent-name-or-human"
status: "draft | review | canonical | archived"

# --- LAYER 0: HUMAN INTENT ---
mission:
  statement: "What we are trying to accomplish"
  north_star: "The ultimate vision this serves"
  steward: "human-identifier"

# --- LAYER 1: PROTOCOL STRUCTURE ---
context:
  current_architecture: "How the system is currently structured"
  known_evidence:
    - id: "evidence-001"
      source: "experiment | observation | document"
      summary: "What we know"
      confidence: "high | medium | low"
  open_questions:
    - id: "question-001"
      question: "What remains unknown"
      blocking: true | false
  constraints:
    - "Technical limitation"
    - "Ethical boundary"
    - "Resource constraint"
  dependencies:
    - id: "dep-001"
      type: "skill | protocol | hardware | external_service"
      status: "available | in_development | blocked"
  objectives:
    - id: "obj-001"
      description: "What success looks like"
      measurable: true | false
      metric: "How we measure it"
  current_milestones:
    - id: "mile-001"
      description: "What we are working on now"
      status: "not_started | in_progress | complete | blocked"
      owner: "agent-or-human"

# --- LAYER 2: KNOWLEDGE LAYER ---
knowledge:
  related_matrices:
    - "matrix-id-001"
    - "matrix-id-002"
  canonical_references:
    - repo: "quillyos-foundation"
      path: "architecture/HUB_SPOKE_LAYERS.md"
      version: "v1.0"
  assumptions:
    - id: "assum-001"
      statement: "What we are assuming"
      risk: "high | medium | low"
  contradictions:
    - id: "contr-001"
      description: "Known conflicts"
      resolution_status: "open | resolved | accepted"

# --- LAYER 3: EXECUTION LAYER ---
agents:
  - role: "chief_architect | knowledge_curator | automation_engineer | ..."
    responsibilities:
      - "What this agent should do with this context"
    outputs:
      - "Expected artifacts"
    constraints:
      - "What this agent must not do"

workflows:
  - id: "wf-001"
    name: "workflow-name"
    trigger: "event | schedule | manual"
    steps:
      - "Step description"
    output_artifact: "what this produces"

# --- LAYER 4: REALITY FEEDBACK ---
evidence:
  - id: "ev-001"
    type: "sensor | market | experiment | observation"
    data: "Raw or summarized data"
    timestamp: "2026-07-08T00:00:00Z"
    source: "hardware-node-id | market-api | human-observation"
```

---

## 4. AGENT CONTEXT PACKAGE

When an agent is invoked, it receives an **Agent Context Package** — a subset of the Context Matrix tailored to its role.

### Package Structure

```yaml
package_version: "1.0"
recipient_agent: "agent-role"
context_matrix_id: "source-matrix-id"
relevant_sections:
  - "mission"
  - "current_architecture"
  - "objectives"
  - "knowledge.assumptions"
instructions:
  - "What the agent should do"
  - "What format the response should take"
  - "What artifacts to produce"
constraints:
  - "What the agent must not do"
  - "Ethical boundaries"
output_format: "markdown | yaml | json | structured_text"
```

### Response Format

Every agent response must be structured:

```yaml
response_version: "1.0"
agent_id: "agent-role"
context_matrix_id: "source-matrix-id"
timestamp: "2026-07-08T00:00:00Z"

reasoning:
  - "Step-by-step reasoning trace"

proposals:
  - id: "prop-001"
    description: "What is being proposed"
    rationale: "Why this is the right approach"
    risks:
      - "What could go wrong"
    alternatives:
      - "What was considered and rejected"

artifacts:
  - id: "art-001"
    type: "document | code | workflow | decision | skill"
    format: "markdown | python | yaml | json"
    content: "..."
    references:
      - "evidence-id-001"

next_steps:
  - "What should happen next"
  - "Who should do it"

confidence: "high | medium | low"
```

---

## 5. EVENT BUS

The Nexus Protocol uses an event-driven architecture for loose coupling.

### Event Types

| Event | Description | Producer | Consumer |
|-------|-------------|----------|----------|
| `document.ingested` | New document captured | PicoClaw | Knowledge Curator |
| `knowledge.updated` | Canonical knowledge changed | Knowledge Curator | All agents |
| `proposal.created` | New proposal submitted | Any agent | Governance Steward |
| `decision.recorded` | Decision finalized | Governance Steward | All agents |
| `skill.deployed` | New skill available | Automation Engineer | PicoClaw |
| `node.joined` | New mesh node registered | Node | Hub |
| `evidence.collected` | New evidence gathered | Any node | Knowledge Curator |
| `session.ended` | Session brief ready | Any agent | Git sync |

### Event Format

```yaml
event_id: "uuid"
event_type: "document.ingested"
timestamp: "2026-07-08T00:00:00Z"
source: "agent-id | node-id | human-id"
payload:
  # Event-specific data
context_matrix_refs:
  - "matrix-id-001"
```

---

## 6. REPOSITORY LAYOUT

### quillyos-nexus (Model-Agnostic Shared Understanding)

```
quillyos-nexus/
├── contexts/           ← Context Matrix files
├── matrices/           ← Cross-domain relationship matrices
├── entities/           ← Canonical entity definitions
├── projects/           ← Project-specific context packages
├── roadmaps/           ← Phased evolution plans
├── relationships/      ← Typed connections between entities
├── protocols/          ← Protocol specifications and versions
├── ontology/           ← Ontology definitions and extensions
├── consensus/          ← Approved decisions and doctrine
└── translations/         ← Agent-specific translations of canonical content
```

---

## 7. VERSIONING

- **Protocol version** — Major.Minor (e.g., 1.0). Major changes require consensus.
- **Context Matrix version** — Timestamp-based (e.g., 2026-07-08-v1).
- **Document version** — Git commit hash + semantic tag.
- **Skill version** — Semantic versioning (e.g., 1.2.3).

---

## 8. GOVERNANCE OF THE PROTOCOL

Changes to the Nexus Protocol require:

1. A Proposal document in `protocol/proposals/`
2. Discussion period (minimum 1 session or 24 hours)
3. Evidence that the change improves interoperability
4. Approval by the Governance Steward
5. Version bump and migration guide

---

*This specification is a living document. It evolves through implementation, not aspiration.*
