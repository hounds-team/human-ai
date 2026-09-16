# Context engines

A context engine reduces the cost of understanding a repository before raw source is loaded.

Human + AI treats the capability as optional and implementation-neutral.

## Useful capabilities

### Locate

Find the symbols/files that own a concept or flow.

### Relate

Show relevant structural edges: callers, callees, imports, implementations, ownership, or dependencies.

### Impact

Estimate the surface directly affected by a proposed change.

### Orient

Provide a compact structural snapshot after context compaction, handoff, or a long-running task.

### Diagnose

After edits, inspect the changed symbols for structural problems, missing co-changes, broken contracts, or suspicious dead paths.

## Usage rule

Prefer:

```text
locate -> relate/impact -> read exact source -> edit -> diagnose
```

over broad repository scanning.

The engine is navigation and compression, not authority. Verify current source/configuration before changing it.

## Gortex

Gortex is a recommended optional implementation of several capabilities above.

Install separately:

```bash
curl -fsSL https://get.gortex.dev | sh
gortex install

cd /path/to/project
gortex init
```

If a project already defines Gortex architecture or co-change guards, treat them as project contracts. Do not invent a large guard system merely because the tool supports it.
