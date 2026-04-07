# Role Realization Shape

- **Purpose**: Ensure that every role is realized in at least one process.
- **Description**: A role (BFO_0000023) must be linked to at least one process via `bfo:realized_in` (BFO_0000054). This is a minimal constraint ensuring that roles declared in the knowledge graph are not "dangling" — every role must participate in some process. This is a weaker version of the Role Bearer Shape, which additionally requires a bearer.

## Interactive Diagram

```ontoink
source: shapes/role-realization/shape-data.ttl
shape: shapes/role-realization/shape.ttl
```

## SHACL Constraint

A `Role` (BFO_0000023) must have at least one `bfo:realized_in` (BFO_0000054) relationship.

| Property | Value |
|----------|-------|
| Target class | `BFO_0000023` (Role) |
| Path | `BFO_0000054` (realized_in) |
| Min count | 1 |

## Files

- [shape.ttl](shape.ttl) — SHACL shape definition
- [shape-data.ttl](shape-data.ttl) — Example instance data
