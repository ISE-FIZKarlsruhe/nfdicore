# Role Bearer Shape

- **Purpose**: Ensure that every role has a bearer and is realized in a process.
- **Description**: A role (BFO_0000023) must always be associated with an entity that bears it via `ro:role_of` (RO_0000081) and must be realized in at least one process via `bfo:realized_in` (BFO_0000054). This constraint enforces the BFO pattern that roles are dependent continuants — they cannot exist without a bearer and without being realized.

## Interactive Diagram

```ontoink
source: shapes/role-bearer/shape-data.ttl
shape: shapes/role-bearer/shape.ttl
```

## SHACL Constraints

A `Role` (BFO_0000023) must satisfy both:

| Property | Path | Min count | Meaning |
|----------|------|-----------|---------|
| role_of | `RO_0000081` | 1 | The role must belong to some entity |
| realized_in | `BFO_0000054` | 1 | The role must be realized in some process |

## Files

- [shape.ttl](shape.ttl) — SHACL shape definition
- [shape-data.ttl](shape-data.ttl) — Example instance data
