# HUB-SPOKE MODEL & THE FOUR LAYERS
## Architecture v1.0

---

## THE EVOLUTION

Instead of:
```
Hub → Spokes
```

We define four layers:
```
Layer 0 — Human Intent
Layer 1 — Nexus Protocol
Layer 2 — Knowledge / Reasoning / Memory
Layer 3 — Execution Nodes
Layer 4 — Reality
```

---

## LAYER 0: HUMAN INTENT

**What:** The steward's direction, ethics, and boundaries.

**Who:** Human steward (you).

**Function:**
- Defines the North Star
- Sets ethical boundaries
- Approves major decisions
- Resolves conflicts between agents
- Maintains ownership of Layer 0

**Artifacts:**
- Vision statements
- Ethical boundaries
- Strategic priorities
- Approval of proposals

**Key Principle:** The Hub isn't you anymore. The Hub becomes the Protocol. You remain the steward. That subtle distinction is what allows the architecture to survive decades.

---

## LAYER 1: NEXUS PROTOCOL

**What:** The translation layer that makes human intent machine-interpretable and model-agnostic.

**Who:** Protocol Steward (agent role) + human oversight.

**Function:**
- Structures human intent into Context Matrices
- Ensures all agents receive identical structured context
- Maintains protocol versions
- Translates between agent-specific formats
- Enforces canonical object types

**Artifacts:**
- Context Matrices
- Agent Context Packages
- Protocol specifications
- Ontology definitions
- Event bus schemas

**Key Principle:** Instead of sharing thousands of chat messages, every agent receives the same structured context and produces structured outputs.

---

## LAYER 2: KNOWLEDGE / REASONING / MEMORY

**What:** The structured, versioned, searchable understanding layer.

**Who:** Knowledge Curator (agent role) + all agents (read).

**Function:**
- Ingests and normalizes documents
- Builds cross-references
- Maintains knowledge graph
- Generates search indices
- Produces agent context packages
- Archives validated knowledge

**Artifacts:**
- Knowledge graph
- Search indices
- Canonical knowledge records
- Cross-reference maps
- Entity definitions
- Relationship matrices

**Storage:** Primarily in `quillyos-nexus/` and `quillyos-foundation/`.

**Key Principle:** Knowledge must outlive software. The knowledge layer should be readable by any future agent, regardless of its implementation.

---

## LAYER 3: EXECUTION NODES

**What:** Agents, workflows, hardware nodes that act on the knowledge layer.

**Who:** All specialized agents and physical nodes.

**Nodes:**
- **PicoClaw** — Local cognition node (persistent reasoning, ingestion, skill execution)
- **Kimi** — Systems architect and integrator (coherent architecture, protocol design)
- **GPT** — General reasoning and creative synthesis
- **Manus** — Execution and implementation
- **n8n** — Workflow automation engine
- **Pi Cluster** — Distributed compute and mesh networking
- **Future Nodes** — Quantum-classical interfaces, advanced sensors, edge AI

**Function:**
- Receive context packages from Layer 2
- Perform specialized reasoning
- Produce structured proposals
- Execute approved workflows
- Collect evidence from Layer 4
- Report outcomes back to Layer 2

**Artifacts:**
- Proposals
- Code
- Workflow executions
- Evidence collections
- Skill deployments

**Key Principle:** Agents should not compete. Agents specialize. Each produces artifacts that become shared knowledge.

---

## LAYER 4: REALITY

**What:** The physical world that feeds back into the system.

**Domains:**
- **Hardware** — Physical devices, sensors, actuators
- **Markets** — Financial data, supply chains, economic signals
- **People** — Human users, collaborators, subjects
- **Sensors** — Environmental data, health metrics, scientific measurements

**Function:**
- Provides raw evidence
- Validates predictions
- Tests implementations
- Generates feedback loops
- Drives adaptation

**Artifacts:**
- Sensor data
- Market data
- Experimental results
- User feedback
- Environmental observations

**Feedback Loop:**
```
Reality (Layer 4) → Evidence → Knowledge Curator → Knowledge Update → All Agents → Proposals → Execution → Reality
```

**Key Principle:** The system must adapt to reality, not attempt to model it perfectly. The protocol should survive hardware evolution.

---

## INTER-LAYER COMMUNICATION

### Layer 0 → Layer 1
Human intent is structured into Context Matrices by the Protocol Steward.

### Layer 1 → Layer 2
Context Matrices are stored, indexed, and cross-referenced in the knowledge layer.

### Layer 2 → Layer 3
Agent Context Packages are generated and distributed to relevant execution nodes.

### Layer 3 → Layer 4
Execution nodes act on reality: deploy code, run workflows, collect data.

### Layer 4 → Layer 0
Reality feedback informs human intent. The steward adjusts direction based on evidence.

---

## THE MESH NETWORK

As the system grows, execution nodes form a mesh:

```
        ┌─────────┐
        │ Layer 0 │
        │ Human   │
        └────┬────┘
             │
        ┌────▼────┐
        │ Layer 1 │
        │ Protocol│
        └────┬────┘
             │
        ┌────▼────┐
        │ Layer 2 │
        │Knowledge│
        └────┬────┘
             │
    ┌────────┼────────┐
    │        │        │
 ┌──▼──┐  ┌──▼──┐  ┌──▼──┐
 │Pico │  │ Pi  │  │ Kimi│
 │Claw │  │Clust│  │     │
 └──┬──┘  └──┬──┘  └──┬──┘
    │        │        │
    └────────┼────────┘
             │
        ┌────▼────┐
        │ Layer 4 │
        │ Reality │
        └─────────┘
```

**Clone the repo, become a node.** Anyone who clones `picoclaw-skills` and runs the system becomes a spoke in the collective mesh.

---

*This model is a living document. Propose refinements through the Decision Lifecycle.*
