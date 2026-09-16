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

Choose the cheapest reliable operation that answers the next unresolved question. Context-engine capabilities are conditional, not a checklist.

If the exact file and symbol are already known, read the current source directly. Use `relate` or `impact` only when dependency uncertainty can change the implementation or verification plan. Use `diagnose` only when a concrete post-change risk justifies it.

A healthy path often looks like:

```text
localize if needed -> read exact source -> edit -> verify
```

Add relationship, impact, or diagnostic queries only when they close a specific uncertainty. Do not run them merely because the capability exists.

The engine is navigation and compression, not authority. Verify current source/configuration before changing it.

When the runtime renames or wraps context-engine tools, inspect the mounted tool schema once and use the actual callable name. Do not spend user-visible output narrating tool-name mapping. On a schema error, correct the call once; repeated schema confusion is a signal to change approach or surface an integration problem.

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
