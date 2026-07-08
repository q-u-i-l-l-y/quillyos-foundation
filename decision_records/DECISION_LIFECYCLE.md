# DECISION LIFECYCLE
## How Ideas Graduate to Doctrine

---

## THE LIFECYCLE

```
Observation
    ↓
Hypothesis
    ↓
Proposal
    ↓
Discussion
    ↓
Experiment
    ↓
Evidence
    ↓
Implementation
    ↓
Validation
    ↓
Canonical Knowledge
    ↓
Skill
    ↓
Automation
    ↓
Protocol
```

---

## STAGE DEFINITIONS

### 1. OBSERVATION
**What:** Something noticed in reality, markets, hardware, or systems.

**Input:** Raw data, sensor readings, market signals, user feedback, research findings.

**Output:** Observation record with timestamp, source, and confidence.

**Who:** Any agent, any node, human steward.

**Storage:** `research/observations/` or `quillyos-nexus/evidence/`

---

### 2. HYPOTHESIS
**What:** A testable explanation for an observation.

**Input:** One or more observations.

**Output:** Hypothesis document with predictions, test criteria, and falsification conditions.

**Who:** Research Coordinator, any agent with relevant domain knowledge.

**Storage:** `research/hypotheses/`

**Format:**
```yaml
hypothesis_id: "hyp-001"
statement: "What we believe is true"
predictions:
  - "If X, then Y"
falsification:
  - "If Z, then this hypothesis is false"
observations:
  - "obs-001"
confidence: low
```

---

### 3. PROPOSAL
**What:** A formal suggestion for change to the system.

**Input:** Hypothesis, observation, or strategic need.

**Output:** Proposal document in Nexus Protocol format.

**Who:** Any agent or human.

**Storage:** `governance/proposals/`

**Format:** See `ontology/CANONICAL_OBJECT_TYPES.md` — Proposal type.

**Required Fields:**
- Title and description
- Type (architecture, protocol, skill, workflow, governance, other)
- Affected objects
- Rationale
- Risks
- Alternatives considered
- Implementation plan

---

### 4. DISCUSSION
**What:** Review by relevant agents and human steward.

**Input:** Proposal document.

**Output:** Discussion record with comments, concerns, and modifications.

**Who:** Governance Steward coordinates. Relevant agents review based on specialization.

**Duration:** Minimum 1 session or 24 hours for significant proposals.

**Storage:** `governance/discussions/`

---

### 5. EXPERIMENT
**What:** Controlled test to validate or invalidate a hypothesis.

**Input:** Hypothesis and proposal.

**Output:** Experiment design and execution results.

**Who:** Research Coordinator, Automation Engineer, Hardware R&D Coordinator.

**Storage:** `research/experiments/`

**Format:**
```yaml
experiment_id: "exp-001"
hypothesis: "hyp-001"
design: "How the test is structured"
controls: "What variables are held constant"
measurements: "What is being measured"
results: "What happened"
conclusion: "What this means"
```

---

### 6. EVIDENCE
**What:** Recorded results, data, observations from experiment or reality.

**Input:** Experiment results, sensor data, market data, implementation outcomes.

**Output:** Evidence document with methodology, data, and confidence.

**Who:** Knowledge Curator validates and records.

**Storage:** `research/evidence/` or `quillyos-nexus/evidence/`

---

### 7. IMPLEMENTATION
**What:** The actual change: code, hardware, workflow, or operational procedure.

**Input:** Approved proposal + evidence.

**Output:** Working implementation with documentation.

**Who:** Relevant execution agents (Automation Engineer, Hardware R&D, etc.)

**Storage:** Implementation repos (`picoclaw-dev/`, `n8n-workflows/`, `hardware/`)

---

### 8. VALIDATION
**What:** Verification that implementation produces expected outcomes.

**Input:** Implementation + expected results from proposal.

**Output:** Validation report with pass/fail criteria.

**Who:** Knowledge Curator + relevant agents.

**Storage:** `research/validations/`

---

### 9. CANONICAL KNOWLEDGE
**What:** Accepted truth, versioned, cross-referenced.

**Input:** Validated implementation + evidence.

**Output:** Knowledge record in canonical form.

**Who:** Knowledge Curator promotes to canonical status.

**Storage:** `quillyos-nexus/knowledge/` and `quillyos-foundation/` (if doctrine-level)

**Criteria for Promotion:**
- Evidence supports the claim
- No unresolved contradictions
- Cross-referenced with existing knowledge
- Human steward aware (for doctrine-level)

---

### 10. SKILL
**What:** A deployable capability derived from canonical knowledge.

**Input:** Canonical knowledge + implementation.

**Output:** Packaged skill with manifest, tests, and documentation.

**Who:** Automation Engineer packages. Governance Steward approves.

**Storage:** `picoclaw-skills/`

---

### 11. AUTOMATION
**What:** A skill that runs without human intervention.

**Input:** Stable skill with clear triggers and outputs.

**Output:** Automated workflow or daemon.

**Who:** Automation Engineer configures. Human steward approves for autonomous operation.

**Storage:** `n8n-workflows/` or `picoclaw-dev/`

---

### 12. PROTOCOL
**What:** A stabilized automation that becomes standard operating procedure.

**Input:** Proven automation with documented behavior.

**Output:** Protocol specification.

**Who:** Protocol Steward documents. Governance Steward approves.

**Storage:** `quillyos-foundation/protocol/`

---

## DECISION RECORD FORMAT

Every significant decision is recorded as:

```markdown
# DECISION RECORD: [ID]
## Title: [Short description]
## Date: [ISO timestamp]
## Status: [proposed | approved | implemented | superseded]

### Context
[What situation required this decision]

### Options Considered
1. [Option A] — [Pros / Cons]
2. [Option B] — [Pros / Cons]
3. [Option C] — [Pros / Cons]

### Decision
[What was chosen]

### Rationale
[Why this option was chosen]

### Consequences
[Expected outcomes]

### Reversibility
[reversible / irreversible]

### Review Date
[When to revisit]

### Steward Approval
[Yes / No / N/A]

### References
- [Related documents]
- [Evidence IDs]
```

**Storage:** `decision_records/DR-[ID]-[short-name].md`

---

## FAST-TRACK DECISIONS

Not all decisions require the full lifecycle. Small, reversible decisions can be fast-tracked:

**Criteria for Fast-Track:**
- Reversible within one session
- No new dependencies
- No ethical implications
- Affects only one repository
- Has clear precedent

**Fast-Track Process:**
1. Agent proposes
2. Human steward approves (or auto-approve if pre-authorized)
3. Record in `decision_records/fast-track/`
4. Implement

---

*This lifecycle is a living document. Propose refinements as Proposals.*
