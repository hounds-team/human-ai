# Durable Context

Durable Context is the small body of project knowledge that should remain useful after the current task is forgotten.

## Suggested shape

Projects that need it may create:

```text
.human-ai/
  context/
    INDEX.md
    ...focused notes by project boundary
  runs/
    ...optional retained run evidence
```

Run `skills/human-ai/scripts/init-context.sh` from the repository root to create a minimal router.

## Router first

`INDEX.md` should answer:

- which durable topics exist;
- where each topic is owned;
- when an agent should load it;
- which source is authoritative when the note is only a summary.

Do not make `INDEX.md` a second copy of all project documentation.

## Good candidates

- product invariants and non-obvious business rules;
- architecture/service boundaries with consequences across files;
- project-specific conventions that affect correctness;
- deployment, recovery, or operations facts that cannot be safely inferred;
- material decisions whose constraints still apply.

## Bad candidates

- function inventories;
- copied code snippets;
- current row counts or changing registries;
- raw run transcripts;
- speculative future plans;
- facts already obvious from one authoritative manifest/configuration file.

## Ownership

Prefer one owner for each fact.

If code/configuration is authoritative, Durable Context should point to it and explain the lasting rule rather than duplicate volatile detail.

A task log can explain how a change happened. It should not become the only place where current project truth lives.

## Update rule

At closeout, ask:

> Would a competent agent working on a different task later make a materially better decision because this fact was preserved?

If not, do not promote it.
