# QUILLYOS // ARCHITECTURE
## Version 4.0 — Living Document
### Status: Canonical Truth

---

## THE FIVE REPOSITORIES

The ecosystem is organized into five canonical repositories, each with a single,
well-defined responsibility. The Hub (Quilly) reasons across them through the
Nexus Protocol.

```
quillyos-foundation/      — Canonical Truth
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

quillyos-nexus/           — Translation Layer
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

quillyos-knowledge-base/  — Persistent Memory
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
    ├── agents/
    ├── decision_logs/
    ├── lessons/
    ├── iterations/
    └── failed_attempts/

picoclaw-skills/          — Skills Library
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
    │   └── ethics/
    ├── manifests/
    └── docs/

picoclaw-dev/             — Runtime / Agent
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
```

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
