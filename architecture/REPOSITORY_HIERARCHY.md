# REPOSITORY HIERARCHY
## QuillyOS Ecosystem Structure v1.0

---

## PRINCIPLE

Everything points upward. Nothing duplicates doctrine.

`quillyos-foundation` contains truth. Every other repository references it. No repository duplicates the doctrine defined here.

---

## VISUAL HIERARCHY

```
                    ┌─────────────────┐
                    │  quillyos-      │
                    │  foundation     │  ← Truth. Doctrine. Principles.
                    │  (Layer 0-1)    │
                    └────────┬────────┘
                             │
              ┌──────────────┼──────────────┐
              │              │              │
     ┌────────▼─────┐ ┌──────▼──────┐ ┌─────▼──────┐
     │ quillyos-    │ │ picoclaw-   │ │ picoclaw-  │
     │ nexus        │ │ dev         │ │ skills     │
     │ (Shared      │ │ (Cognition  │ │ (Public    │
     │  Context)    │ │  Node)      │ │  Library)  │
     └────────┬─────┘ └──────┬──────┘ └─────┬──────┘
              │              │              │
     ┌────────▼─────┐ ┌──────▼──────┐ ┌─────▼──────┐
     │ n8n-         │ │ hardware    │ │ research   │
     │ workflows    │ │ (Physical   │ │ (Evidence  │
     │ (Execution)  │ │  Layer)     │ │  Base)     │
     └──────────────┘ └─────────────┘ └────────────┘
                             │
                    ┌────────▼────────┐
                    │ revenue         │
                    │ (Fuel Ops)      │
                    └─────────────────┘
```

---

## REPOSITORY DEFINITIONS

### quillyos-foundation
**Level:** Layer 0-1 (Human Intent + Protocol)
**Purpose:** Canonical truth. Nothing executable. Only doctrine.
**Contents:**
- Vision, mission, principles
- Protocol specifications
- Ontology definitions
- Governance structures
- Architecture decisions
- Ethical framework
- Evolution rules

**Access:** Human steward + all agents (read). Changes require governance approval.

**Upstream:** None. This is the root.

---

### quillyos-nexus
**Level:** Layer 1-2 (Protocol + Knowledge)
**Purpose:** Model-agnostic shared understanding.
**Contents:**
- Context matrices
- Entity definitions
- Project packages
- Relationship maps
- Consensus records
- Protocol translations

**Access:** All agents (read/write according to role).

**Upstream:** `quillyos-foundation` (principles, protocol spec)

**Key Feature:** GPT can read it. Kimi can read it. Manus can read it. Future PicoClaw can read it. Future hardware nodes can read it.

---

### picoclaw-dev
**Level:** Layer 3 (Execution)
**Purpose:** Local cognition node implementation.
**Contents:**
- Agent runtime
- Ingestion pipeline
- Skill execution engine
- Memory retrieval system
- Local automation
- Git synchronization
- Workflow triggering

**Access:** Local deployment + cluster nodes.

**Upstream:** `quillyos-foundation` (architecture), `quillyos-nexus` (context), `picoclaw-skills` (skills to execute)

---

### picoclaw-skills
**Level:** Layer 3 (Execution)
**Purpose:** Public-facing skills library. The onboarding gateway for mesh nodes.
**Contents:**
- Tiered skills (Revenue → Autonomy → Intelligence → Mod Project)
- Manifest-based skill loading
- MIT-licensed utilities
- Low-level compute modules
- Reverse-engineerable components

**Access:** Public. Anyone who clones becomes a spoke.

**Upstream:** `quillyos-foundation` (principles), `quillyos-nexus` (context matrices for skill domains)

**Key Feature:** Skills must be cloneable, reverse-engineerable, and runnable on low-level compute (Pi Zero, Orange Pi, Termux Android).

---

### n8n-workflows
**Level:** Layer 3 (Execution)
**Purpose:** Execution layer for workflows and integrations.
**Contents:**
- Workflow definitions
- API integration specs
- Event routing rules
- Automation schedules
- Approval pipelines
- External service connectors

**Access:** Automation Engineer + PicoClaw (trigger).

**Upstream:** `quillyos-foundation` (workflow taxonomy), `quillyos-nexus` (context for workflow design)

---

### hardware
**Level:** Layer 4 (Reality)
**Purpose:** Physical layer specifications and roadmaps.
**Contents:**
- ENDS device specifications
- Sensor architectures
- Metamaterial research
- Power systems
- Interface specs
- Raspberry Pi cluster configs
- Quantum-classical interfaces

**Access:** Hardware R&D Coordinator + all agents (read).

**Upstream:** `quillyos-foundation` (architecture principles), `quillyos-nexus` (project contexts)

---

### research
**Level:** Layer 2-4 (Knowledge + Reality)
**Purpose:** Evidence base and experimental findings.
**Contents:**
- Experiment designs
- Raw data
- Analysis results
- Medical platform R&D
- Quantum communication research
- Metamaterial studies
- Biotech interfaces

**Access:** Research Coordinator + all agents (read).

**Upstream:** `quillyos-foundation` (evidence standards), `quillyos-nexus` (knowledge cross-references)

---

### revenue
**Level:** Layer 3 (Execution)
**Purpose:** Fuel operations and sustainability.
**Contents:**
- Service arbitrage workflows
- Real estate wholesale operations
- Digital product specs
- Trading strategies
- Supply chain positioning
- Investment frameworks

**Access:** Revenue Strategist + Automation Engineer.

**Upstream:** `quillyos-foundation` (revenue principles), `quillyos-nexus` (market context)

---

## REFERENCE RULES

### Rule 1: Upward Only
Lower repositories may reference higher repositories. Higher repositories never reference lower ones.

```
✓ picoclaw-dev references quillyos-foundation
✓ quillyos-nexus references quillyos-foundation
✗ quillyos-foundation references picoclaw-dev
```

### Rule 2: No Doctrine Duplication
No repository may duplicate the principles, ontology, or governance defined in `quillyos-foundation`. It may reference them by path and version.

### Rule 3: Context Matrix References
When a repository needs shared context, it references a Context Matrix in `quillyos-nexus`, not a conversation or document in another implementation repo.

### Rule 4: Version Pinning
Implementation repositories should pin to specific versions of foundation documents. Updates to foundation should trigger review in downstream repos.

---

## SYNCHRONIZATION PATTERNS

### Pattern A: Foundation Change Cascade
```
quillyos-foundation update
    → Governance Steward notifies downstream maintainers
    → Each repo reviews impact
    → Updates references if needed
    → Records decision in decision_records/
```

### Pattern B: Evidence Upload
```
research/ experiment completes
    → Knowledge Curator ingests evidence
    → Cross-references with existing knowledge
    → Updates quillyos-nexus/entities/
    → Agents receive updated context packages
```

### Pattern C: Skill Deployment
```
Automation Engineer packages skill
    → Pushes to picoclaw-skills/
    → Updates manifest
    → PicoClaw nodes auto-pull (if configured)
    → Mesh nodes clone and register
```

---

*This hierarchy is a living document. Propose structural changes through the Decision Lifecycle.*
