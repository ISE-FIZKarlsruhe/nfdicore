# SHACL Shapes for Consistency Tests

This section documents SHACL shapes used for validating NFDIcore-based knowledge graphs. Each shape defines constraints that instances must satisfy to be considered consistent.

## Structure

Each shape is organized as a folder containing:

- **pattern.md** — Documentation with a D2 diagram illustrating the constraint
- **shape.ttl** — The SHACL shape definition in Turtle format
- **shape-data.ttl** — Example RDF data (valid instances) for testing

## Available Shapes

| Shape | Target Class | Constraint |
|-------|-------------|------------|
| [Textual Entity](textual-entity/pattern.md) | IAO:Textual Entity | Must always be *about* something |
| [Role Bearer](role-bearer/pattern.md) | BFO:Role | Must have a bearer (*role of*) and be *realized in* a process |
| [Role Realization](role-realization/pattern.md) | BFO:Role | Must be *realized in* some process |

