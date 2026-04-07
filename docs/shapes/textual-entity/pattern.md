# Textual Entity Shape

- **Purpose**: Ensure that every textual entity is always *about* something.
- **Description**: A textual entity (IAO_0000300), such as a publication, report, or annotation, must be linked to at least one entity via the `iao:is about` (IAO_0000136) property. This constraint ensures that textual entities in the knowledge graph are never orphaned — they always reference the subject matter they describe.

## Interactive Diagram

```ontoink
source: shapes/textual-entity/shape-data.ttl
shape: shapes/textual-entity/shape.ttl
```

## SHACL Constraint

A `Textual Entity` (IAO_0000300) must have at least one `iao:is about` (IAO_0000136) relationship.

| Property | Value |
|----------|-------|
| Target class | `IAO_0000300` (Textual Entity) |
| Path | `IAO_0000136` (is about) |
| Min count | 1 |

## Files

- [shape.ttl](shape.ttl) — SHACL shape definition
- [shape-data.ttl](shape-data.ttl) — Example instance data
