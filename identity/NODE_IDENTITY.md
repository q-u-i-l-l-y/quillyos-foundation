# NODE IDENTITY
## Identity, Reputation, and Access

---

## PURPOSE

Every node in the QuillyOS mesh — whether an AI agent, a Raspberry Pi, a Termux instance, or a future hardware device — has an identity. Identity enables trust, reputation, and secure communication.

---

## IDENTITY STRUCTURE

```yaml
node_identity:
  id: "uuid-v4"
  name: "human-readable-name"
  type: "agent | pi_zero | pi_3 | pi_4 | termux | cloud | edge | future"

  # Cryptographic identity
  public_key: "ssh-ed25519 AAAA..."
  fingerprint: "sha256:..."

  # Capabilities
  capabilities:
    - "skill_execution"
    - "document_ingestion"
    - "workflow_trigger"
    - "sensor_reading"

  # Network
  network:
    mesh_address: "optional-mesh-ip"
    git_remote: "https://github.com/..."

  # Registration
  registered_at: "2026-07-08T00:00:00Z"
  registered_by: "human-steward-or-parent-node"

  # Status
  status: "active | standby | offline | decommissioned"
  last_seen: "2026-07-08T00:00:00Z"

  # Reputation
  reputation:
    score: 0.0  # -1.0 to 1.0
    contributions: 0
    validations: 0
    disputes: 0
```

---

## REPUTATION SYSTEM

### Scoring
- **Contributions** — Knowledge artifacts, skills, evidence submitted
- **Validations** — Evidence verified, decisions reviewed, proposals approved
- **Disputes** — Contradictions raised, errors found, corrections made

### Score Calculation
```
reputation = (contributions * 0.4 + validations * 0.5 - disputes * 0.3) / total_interactions
```

Capped at [-1.0, 1.0]. New nodes start at 0.0.

### Reputation Levels
| Score | Level | Permissions |
|-------|-------|-------------|
| -1.0 to -0.5 | Untrusted | Read-only, flagged for review |
| -0.5 to 0.0 | New / Unverified | Read, limited write |
| 0.0 to 0.5 | Trusted | Full read/write in assigned domains |
| 0.5 to 1.0 | Core Contributor | Governance participation, protocol change proposals |

---

## ACCESS PATTERNS

### Read Access
- All nodes can read `quillyos-foundation` (doctrine)
- All nodes can read `quillyos-nexus` (shared context)
- Nodes read implementation repos based on role

### Write Access
- **Foundation:** Governance Steward + human steward only
- **Nexus:** Knowledge Curator + relevant agents
- **Implementation:** Assigned agents + human steward
- **Skills:** Automation Engineer + approved contributors

### Mesh Communication
- Nodes authenticate via public key
- Messages are signed
- Reputation affects message priority
- Untrusted nodes are quarantined

---

## NODE REGISTRATION

### For New Nodes (Clone-to-Node)

1. Clone `picoclaw-skills` repository
2. Run `install.sh` (generates identity, discovers capabilities)
3. Register with mesh hub
4. Receive context package
5. Begin operation as spoke

### Identity Generation
```bash
# Generate SSH key pair
ssh-keygen -t ed25519 -f ~/.quillyos/node_id -N ""

# Extract public key fingerprint
ssh-keygen -lf ~/.quillyos/node_id.pub
```

---

## PRIVACY

- Node identities are pseudonymous by default.
- Real-world identity is optional and steward-controlled.
- Health data is encrypted with node-specific keys.
- Mesh communication is encrypted.
- Nodes can leave the mesh and delete their identity.

---

*This identity system is a living document. Propose refinements through the Decision Lifecycle.*
