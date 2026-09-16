# Independent Pass

Use an Independent Pass when a fresh context is more valuable than another self-review by the builder.

## Inputs

Give the reviewer:

- the requested outcome or Task Brief;
- the exact revision/diff being reviewed;
- project-specific contracts relevant to the change;
- verification evidence;
- affected source and direct dependencies needed to validate concerns.

Do not require the reviewer to inherit the builder's full conversation or rationale.

## Reviewer job

Diagnose only demonstrated problems.

A useful concern states:

```text
Location     where the issue exists
Evidence     what is observed
Contract     what agreed behavior/rule conflicts with it
Trigger      realistic conditions that expose it
Impact       what breaks or becomes unsafe
```

Severity should follow consequence, not how sophisticated the concern sounds.

## Scope boundary

A review concern is not an instruction to redesign.

Apply a correction autonomously only when it is local, inside the agreed task, and preserves the intended behavior/architecture/data contract.

Anything else becomes a human decision.

## Loop limit

Start with one fresh Independent Pass.

If accepted corrections materially changed the reviewed behavior, run one follow-up pass. After that, stop automatic review and expose remaining concerns or decisions.

The purpose is independent evidence, not perfect convergence.
