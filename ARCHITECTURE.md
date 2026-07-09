# QUILLYOS // ARCHITECTURE
## Version 4.2 — Living Document
### Status: Canonical Truth

---

## THE SEVEN REPOSITORIES

The ecosystem is organized into seven canonical repositories, each with a single,
well-defined responsibility. The Hub (Quilly) reasons across them through the
Nexus Protocol.

Governance emerges from interaction rather than centralization.

```
quillyos-foundation/      — Canonical Truth (Defines philosophy)
    ├── VISION.md
    ├── MISSION.md
    ├── ETHICS.md
    ├── ARCHITECTURE.md
    ├── NORTH_STAR.md
    ├── IDENTITY.md
    ├── ROADMAP.md
    ├── REVENUE_MODEL.md
    ├── GLOSSARY.md
    └── protocols/
        ├── nexus-language.md
        ├── decision-framework.md
        └── reasoning-principles.md

quillyos-nexus/           — Translation Layer (Defines communication)
    ├── SPEC.md
    ├── NEXUS_PROTOCOL.md
    ├── SUPERPOSITION.md
    ├── AGENT_SCHEMA.md
    ├── CONTEXT_SCHEMA.md
    ├── TASK_SCHEMA.md
    ├── KNOWLEDGE_SCHEMA.md
    ├── REASONING_SCHEMA.md
    ├── DECISION_SCHEMA.md
    └── translation/
        ├── claude.md
        ├── gpt.md
        ├── kimi.md
        ├── manus.md
        ├── ollama.md
        ├── qwen.md
        ├── n8n.md
        ├── termux.md
        ├── raspberrypi.md
        └── superposition.md

quillyos-knowledge-base/  — Persistent Memory (Stores evidence)
    ├── README.md
    ├── knowledge_index.md
    ├── nexus_matrix.json
    ├── crawl/
    ├── research/
    ├── discoveries/
    ├── reverse_engineering/
    ├── instagram/
    ├── reddit/
    ├── papers/
    ├── medical/
    ├── metamaterials/
    ├── quantum/
    ├── casimir/
    ├── ornith/
    ├── origin_pilot/
    ├── molecular_3d_printing/
    ├── agents/
    ├── decision_logs/
    ├── lessons/
    ├── iterations/
    └── failed_attempts/

picoclaw-skills/          — Skills Library (Stores capability)
    ├── skills/
    │   ├── business/
    │   ├── affiliate/
    │   ├── arbitrage/
    │   ├── real_estate/
    │   ├── freelance/
    │   ├── gumroad/
    │   ├── coding/
    │   ├── termux/
    │   ├── raspberrypi/
    │   ├── ollama/
    │   ├── qwen/
    │   ├── telegram/
    │   ├── crawler/
    │   ├── summarizer/
    │   ├── reasoner/
    │   ├── planner/
    │   ├── researcher/
    │   ├── writer/
    │   ├── hardware/
    │   ├── medical/
    │   ├── quantum/
    │   ├── metamaterials/
    │   ├── casimir/
    │   ├── ornith/
    │   └── ethics/
    ├── manifests/
    └── docs/

picoclaw-dev/             — Runtime / Agent (Executes capability locally)
    ├── runtime/
    ├── agents/
    ├── memory/
    ├── ingestion/
    ├── crawler/
    ├── github/
    ├── telegram/
    ├── scheduler/
    ├── planner/
    ├── orchestrator/
    ├── decision/
    ├── plugins/
    └── config/

quillyos-n8n/             — Execution Layer (Orchestrates workflows)
    ├── workflows/
    ├── credentials/
    ├── webhooks/
    ├── templates/
    └── docs/

quillyos-roadmap/         — Evolution Tracker (Tracks milestones)
    ├── README.md
    ├── current_phase.md
    ├── milestones/
    ├── dependencies/
    ├── risks/
    ├── completed/
    ├── upcoming/
    └── architecture_evolution.md
```

---

## GOVERNANCE

Repositories do not compete. Each owns one responsibility.

| Layer | Repository | Responsibility |
|-------|------------|---------------|
| Philosophy | quillyos-foundation | Defines the immutable vision |
| Translation | quillyos-nexus | Defines how systems communicate |
| Evidence | quillyos-knowledge-base | Stores all discoveries |
| Capability | picoclaw-skills | Packages executable functions |
| Execution | picoclaw-dev | Runs capabilities locally |
| Orchestration | quillyos-n8n | Executes workflows and automations |
| Evolution | quillyos-roadmap | Tracks milestones and architecture changes |
| Wisdom | Human collaboration | Provides judgment and direction |

Governance emerges from interaction rather than centralization.

---

## PROGRESSIVE CAPABILITY

The protocol scales across all compute tiers without modification:

```
phone → Termux → PicoClaw → Raspberry Pi → clusters →
future heterogeneous compute → future quantum-assisted infrastructure
```

Capability increases. Protocol remains identical.

---

## HUB-SPOKE LANGUAGE

Instead of saying "agent" internally:

```
Hub
    ↓
Node
    ↓
Capability
    ↓
Protocol
    ↓
Memory
    ↓
Translation
    ↓
Execution
    ↓
Feedback
    ↓
Evolution
```

Every repository uses this language.

---

## DATA FLOW

```
Document
    ↓
Ingestion
    ↓
Classification
    ↓
Reasoning
    ↓
Inference
    ↓
Cross-reference
    ↓
Decision
    ↓
Action
    ↓
Git Commit
    ↓
Knowledge Base
    ↓
Skill Update
    ↓
Foundation (if philosophy changed)
```

---

## THE INTENDED LOOP

```
Observe
    ↓
Ingest
    ↓
Reason
    ↓
Learn
    ↓
Translate to Nexus Protocol
    ↓
Update Knowledge Base
    ↓
Improve Skill
    ↓
If core principles changed:
    propose Foundation update
Else:
    continue operating
```

---

## MCP INTEGRATION

The ecosystem integrates with the Model Context Protocol (MCP) as an open standard
for tool interoperability. MCP servers are registered in the nexus and discovered
through the On-device Agent Registry (ODR).

```
PicoClaw (Host)
    ↓
MCP Client
    ↓
MCP Server (Skill)
    ↓
Tool / Data Source
```

This ensures that skills are model-agnostic and can be consumed by any MCP-compatible
system.

---

## MESH MEMORY PROTOCOL (MMP)

For inter-agent memory sharing, the ecosystem implements the Mesh Memory Protocol:

- **CAT7 Schema** — 7-field Cognitive Memory Blocks (Context, Action, Task, Time,
  Evidence, Reasoning, Outcome)
- **SVAF** — Semantic Value Acceptance Filter for field-level quality control
- **Inter-Agent Lineage** — Content-hash parents/ancestors for traceability
- **Remix** — Stores only role-evaluated understanding, never raw peer signal

This creates the overlapping data matrices that form the living nexus.

---

*Generated: 2026-07-09*
*Canonical at: quillyos-foundation/ARCHITECTURE.md*
