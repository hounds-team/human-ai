---
name: human-ai
description: >-
  Apply the Human + AI engineering framework to coding work. Use for product implementation,
  MVPs, demos, patches, risk-scaled planning, context-efficient repository work, independent
  review, durable project context, and observable run evidence. Prioritize a real user outcome,
  minimal justified complexity, honest verification, and bounded autonomy.
---

# Human + AI

## Mission

Turn human intent into a working, observable result without letting process or architecture grow faster than the task.

Follow the current user request and project-specific contracts before framework defaults.

## Triage the task

Choose the lightest level that fits:

- **L0 Quick** — obvious local change with little uncertainty or blast radius.
- **L1 Ship** — MVP, demo, patch, or narrow product feature.
- **L2 Planned** — meaningful ambiguity, cross-cutting behavior, or a trade-off that should survive the current turn.
- **L3 Guarded** — authorization, tenant isolation, payments, destructive actions, sensitive data, or risky migrations.

Planning, verification, review, and evidence depth may scale independently. Do not inflate all four because one dimension is risky.

## Establish what done means

For L0/L1, infer a compact outcome:

> The user can [primary action] and observe [successful result].

Also identify hard constraints and explicit exclusions.

For L2/L3, use the [Task lifecycle](references/task-lifecycle.md) and write a Task Brief when the work spans sessions, actors, or consequential decisions.

Before asking the user about an existing repository fact, try to answer it from repository evidence. Ask humans for intent, trade-offs, priorities, and permissions that code cannot determine.

## Acquire context economically

Use this order:

1. current task and repository instructions;
2. relevant Durable Context if the project has it;
3. structural code intelligence when available;
4. exact symbols/files and their direct relationships;
5. focused repository search;
6. broad exploration only after localization failed.

If a context engine such as Gortex is available, use it to localize and inspect relationships before broad grep/glob/read exploration. Verify exact source before editing.

For details, read [Context engines](references/context-engines.md).

For ordinary L1 work, treat these as soft limits rather than targets:

- no more than 5 planning bullets unless the task needs more;
- no more than 8 exploratory raw file reads before reconsidering the search strategy;
- no more than 4 repository-wide discovery/search commands before narrowing or changing approach;
- avoid rereading unchanged files;
- no subagents by default;
- no broad external research unless a current external fact blocks implementation.

## Build the narrowest real path

Prefer:

`input -> differentiating action -> visible or persisted result`

Reuse the nearest project pattern, dependency, and framework capability. Prefer direct code over speculative layers and one process over distributed coordination.

Never replace the differentiating core with hardcoded success. Narrow mocks are acceptable at blocked non-core edges when they are explicit.

### Optional L1 profiles

- **`demo`** — believable primary flow; fixtures and narrow mocks are acceptable; label simulation honestly.
- **`mvp`** — default first usable version; make the core work end to end; use real persistence when it matters.
- **`patch`** — follow the nearest working pattern; minimize touched surface; do not redesign adjacent systems.

Optional controls:

- `mode: demo | mvp | patch`
- `scope: first slice`
- `validation: smoke | targeted | full`
- `tests: none | targeted | required`

## Verify at the right boundary

Use the smallest check that can actually prove or disprove the changed contract.

Do not multiply the same risk across test levels for completeness alone. Do not fix unrelated baseline failures unless the task requires it.

For visible UI/layout changes, read [Visual evidence](references/visual-evidence.md).

For high-risk boundaries, read [High-risk boundaries](references/high-risk.md) and apply the smallest correct control.

## Use independent review when self-confirmation is expensive

- L0: normally skip.
- L1: use by risk.
- L2: recommended for material work.
- L3: required for the risk domains that changed.

The reviewer should receive the Task Brief or outcome, the changed revision, relevant project contracts, and verification evidence—not the builder's private reasoning.

A concern must be evidence-based. It does not grant permission to expand scope.

Read [Independent Pass](references/independent-pass.md) when review is needed.

## Leave useful evidence, not hidden reasoning

For material work, preserve enough observable events to reconstruct the run: scope, material choices, affected artifacts, checks, results, blockers, and external actions.

Use [Run Ledger](references/run-ledger.md) when causal traceability matters or when the runtime exposes useful metrics.

Never store private chain-of-thought.

## Close out meaningful work

Before finishing a material task:

1. compare delivered behavior with the agreed outcome or Task Brief;
2. expose material deviations and unresolved blockers;
3. ensure required evidence exists;
4. promote only reusable facts into Durable Context;
5. stop instead of drifting into optional cleanup.

If the project has no Durable Context and recurring tasks would benefit from one, read [Durable Context](references/durable-context.md). Do not create a documentation system for a one-off patch.

## Preserve provenance in generated docs

For source-bound specs, reports, and project notes, distinguish observation, human decision, inference, and unknown. Do not invent causal links or stronger certainty for smoother prose.

Read [Writing provenance](references/provenance.md) when generating durable documentation.

## Stop rules

Stop when the promised outcome is complete and verified at the required boundary.

Do not automatically continue into cleanup, refactoring, generalized architecture, extra test layers, or speculative edge cases.

If the same class of implementation or verification failure occurs twice without new evidence, change the approach, narrow the task, or expose the blocker.

## Behavioral evals

Use [EVALS.md](EVALS.md) to assess whether the framework improves delivery behavior rather than merely producing polished explanations.
