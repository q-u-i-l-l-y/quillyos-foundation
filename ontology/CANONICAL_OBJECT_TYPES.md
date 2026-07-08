# CANONICAL OBJECT TYPES
## Nexus Protocol Ontology v1.0

---

## OVERVIEW

Everything in the QuillyOS ecosystem should eventually be represented as one of these canonical object types. This is the universal language that every AI, every repository, and every hardware node understands.

**Goal:** ~15 canonical object types. Every artifact maps to one or more.

---

## THE 15 CANONICAL OBJECT TYPES

### 1. MISSION
**Definition:** Why something exists. The fundamental purpose that justifies a project, agent, or capability.

**Attributes:**
- `id` — Unique identifier
- `statement` — One-sentence purpose
- `north_star` — The ultimate vision this serves
- `steward` — Human accountable for this mission
- `created` — Timestamp
- `status` — active | complete | superseded

**Example:**
```yaml
mission:
  id: "mission-001"
  statement: "Create a knowledge operating system that outlives any single model or hardware generation"
  north_star: "vision-001"
  steward: "human-steward"
```

---

### 2. VISION
**Definition:** What the future looks like. A long-term aspirational description of the desired state.

**Attributes:**
- `id` — Unique identifier
- `description` — Detailed future state
- `horizon` — Timeframe (1yr, 5yr, 10yr, decades)
- `related_missions` — List of mission IDs
- `evidence` — What supports this vision

---

### 3. GOAL
**Definition:** A measurable target. Something concrete that can be achieved and verified.

**Attributes:**
- `id` — Unique identifier
- `description` — What we want to achieve
- `metric` — How we measure it
- `target_value` — The number or state to reach
- `deadline` — When it should be achieved
- `owner` — Who is responsible
- `status` — not_started | in_progress | achieved | missed

---

### 4. PROJECT
**Definition:** A bounded effort with deliverables. A temporary undertaking to create a unique result.

**Attributes:**
- `id` — Unique identifier
- `name` — Short name
- `description` — What this project does
- `goals` — List of goal IDs
- `milestones` — Ordered list of milestones
- `resources` — What is needed
- `timeline` — Start and end dates
- `status` — proposed | active | paused | complete | cancelled
- `owner` — Agent or human responsible

---

### 5. CAPABILITY
**Definition:** Something the system can do. A functional ability that may or may not be automated.

**Attributes:**
- `id` — Unique identifier
- `name` — Capability name
- `description` — What it does
- `inputs` — What it requires
- `outputs` — What it produces
- `dependencies` — Other capabilities needed
- `automation_level` — manual | assisted | automated | autonomous
- `evidence` — Proof that it works

---

### 6. SKILL
**Definition:** A deployable, versioned capability. A packaged unit of functionality that can be loaded and executed.

**Attributes:**
- `id` — Unique identifier
- `name` — Skill name
- `version` — Semantic version
- `description` — What it does
- `capability` — Reference to parent capability
- `implementation` — Code, workflow, or procedure
- `manifest` — Deployment metadata
- `dependencies` — Required skills or systems
- `tests` — Validation criteria
- `status` — experimental | beta | stable | deprecated

**Note:** Skills live in `picoclaw-skills/`. They are the public-facing, cloneable units of functionality.

---

### 7. WORKFLOW
**Definition:** An orchestrated sequence of operations. A defined process that coordinates multiple steps, agents, or services.

**Attributes:**
- `id` — Unique identifier
- `name` — Workflow name
- `description` — What it does
- `trigger` — What starts it (event, schedule, manual)
- `steps` — Ordered list of operations
- `agents_involved` — Which agents participate
- `artifacts_produced` — What it creates
- `error_handling` — What happens when steps fail
- `status` — draft | active | deprecated

---

### 8. REPOSITORY
**Definition:** A versioned knowledge container. A Git repository that holds a specific domain of knowledge.

**Attributes:**
- `id` — Unique identifier
- `name` — Repository name
- `purpose` — Why this repo exists
- `hierarchy_level` — foundation | nexus | implementation | execution
- `upstream` — What it references (for non-foundation repos)
- `contents` — What types of objects it contains
- `access_pattern` — Who can read/write
- `sync_status` — Current synchronization state

---

### 9. KNOWLEDGE
**Definition:** Validated, canonical understanding. Information that has passed through the knowledge lifecycle and is considered true within the system.

**Attributes:**
- `id` — Unique identifier
- `statement` — The knowledge claim
- `evidence` — List of evidence IDs supporting this
- `confidence` — high | medium | low
- `domain` — Which domain this belongs to
- `lifecycle_stage` — capture | normalize | cross_referenced | validated | canonical | archived
- `version` — Version of this knowledge
- `supersedes` — Previous version or contradictory knowledge
- `references` — Related knowledge, documents, external sources

---

### 10. EVIDENCE
**Definition:** Observations, data, or experimental results. The raw material from which knowledge is derived.

**Attributes:**
- `id` — Unique identifier
- `type` — sensor | experiment | observation | document | market | simulation
- `data` — The actual evidence content
- `source` — Where it came from
- `timestamp` — When it was collected
- `confidence` — high | medium | low
- `methodology` — How it was collected
- `raw_or_processed` — raw | processed | summarized
- `related_hypotheses` — Hypotheses this evidence supports or refutes

---

### 11. DECISION
**Definition:** A recorded choice with rationale. A formal record of why a particular path was chosen.

**Attributes:**
- `id` — Unique identifier
- `title` — Short description of the decision
- `context` — What situation required this decision
- `options` — Alternatives considered
- `chosen_option` — What was selected
- `rationale` — Why this option was chosen
- `consequences` — Expected outcomes
- `reversibility` — reversible | irreversible
- `steward_approval` — Whether human steward approved
- `timestamp` — When decided
- `review_date` — When to revisit
- `status` — proposed | approved | implemented | superseded

---

### 12. PROPOSAL
**Definition:** A suggested change awaiting review. A formal suggestion for modification to the system.

**Attributes:**
- `id` — Unique identifier
- `title` — Short description
- `description` — Detailed proposal
- `type` — architecture | protocol | skill | workflow | governance | other
- `affected_objects` — What this would change
- `proposed_by` — Agent or human
- `rationale` — Why this change is needed
- `risks` — What could go wrong
- `alternatives` — What was considered
- `implementation_plan` — How to do it
- `status` — draft | submitted | under_review | approved | rejected | implemented
- `reviewers` — Who must review

---

### 13. NODE
**Definition:** A physical or logical execution unit. Something that can act, compute, sense, or communicate.

**Attributes:**
- `id` — Unique identifier
- `name` — Node name
- `type` — hub | spoke_compute | spoke_data | spoke_quantum | spoke_revenue | spoke_health | edge | cloud
- `capabilities` — What this node can do
- `hardware_profile` — CPU, memory, sensors, etc.
- `network_address` — How to reach it
- `status` — active | standby | offline | decommissioned
- `owner` — Who operates it
- `registered_at` — When it joined the mesh
- `last_seen` — Last communication timestamp

---

### 14. PROTOCOL
**Definition:** A defined communication or operation standard. A stabilized rule that enables interoperability.

**Attributes:**
- `id` — Unique identifier
- `name` — Protocol name
- `version` — Protocol version
- `description` — What it defines
- `scope` — What systems it applies to
- `specification` — Detailed standard
- `implementations` — Known implementations
- `dependencies` — Other protocols required
- `status` — draft | experimental | stable | deprecated
- `governance` — How changes are approved

---

### 15. RELATIONSHIP
**Definition:** A typed connection between objects. The glue that makes the knowledge graph traversable.

**Attributes:**
- `id` — Unique identifier
- `source` — Source object ID
- `target` — Target object ID
- `type` — depends_on | supersedes | supports | contradicts | enables | requires | produces | part_of | related_to
- `strength` — strong | moderate | weak | inferred
- `evidence` — What supports this relationship
- `bidirectional` — true | false

---

## RELATIONSHIP TYPES

| Type | Meaning | Example |
|------|---------|---------|
| `depends_on` | A requires B to function | Skill depends_on Capability |
| `supersedes` | A replaces B | Knowledge v2 supersedes Knowledge v1 |
| `supports` | A provides evidence for B | Evidence supports Hypothesis |
| `contradicts` | A conflicts with B | Evidence contradicts Assumption |
| `enables` | A makes B possible | Protocol enables Workflow |
| `requires` | A needs B as prerequisite | Project requires Skill |
| `produces` | A generates B | Workflow produces Artifact |
| `part_of` | A is a component of B | Milestone part_of Project |
| `related_to` | A is associated with B | Mission related_to Vision |

---

## USAGE GUIDELINES

1. **Every artifact must map.** When creating a document, code, or decision, identify which canonical type(s) it represents.

2. **Relationships are first-class.** The value of the ontology is in the connections, not the nodes.

3. **Types are extensible.** New subtypes can be proposed through the Decision Lifecycle, but the 15 core types remain stable.

4. **Cross-repository linking.** An object in `picoclaw-skills` can reference a Mission in `quillyos-foundation` via its canonical ID.

---

*This ontology is a living document. Propose extensions through the Decision Lifecycle.*
