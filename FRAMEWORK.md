# Human + AI Framework

Human + AI scales engineering process to the task instead of forcing every request through one pipeline.

The operating loop is:

```text
intent
  -> triage
  -> acquire context
  -> establish the task brief
  -> build the narrowest real outcome
  -> verify
  -> independent pass when justified
  -> close out
  -> retain only durable context
  -> learn from evals
```

## Instruction precedence

When instructions conflict, use this order:

1. explicit current user intent;
2. project-specific safety rules and contracts;
3. repository instructions and established local patterns;
4. Human + AI defaults.

Human + AI is a fallback operating model, not permission to override a project's explicit rules.

## Communication discipline

Execution is quiet by default. The agent should spend tokens on work and evidence, not on narrating its own process.

Do not surface:

- tool-selection deliberation;
- repeated restatements of the task;
- “I need to…”, “let me…”, or “now I will…” narration;
- routine retries or obvious tool-call corrections;
- repeated summaries of facts that are already established;
- private chain-of-thought or internal debate.

Speak during execution only when at least one of these is true:

1. a human decision is required before safe progress can continue;
2. a blocker changes scope, confidence, or the plan;
3. a meaningful milestone has produced new information useful to the human;
4. the final result or handoff is ready.

A failed tool call is normally corrected silently. If the same failure class repeats twice without new evidence, change approach or expose the blocker instead of narrating the loop.

Tool calls are work, not content. A progress message should report a new fact, decision, or risk—not announce the next tool call.

## Task levels

| Level | Typical work | Brief | Verification | Independent pass | Run evidence |
|---|---|---|---|---|---|
| L0 Quick | obvious local edit | inferred | targeted | normally no | result only |
| L1 Ship | MVP, demo, narrow feature | compact | smoke/targeted | by risk | material decisions |
| L2 Planned | ambiguity, cross-cutting behavior, meaningful trade-off | written | targeted checks/tests | recommended | causal run ledger |
| L3 Guarded | authorization, tenancy, payments, destructive actions, sensitive data, risky migrations | written + explicit risk notes | risk-driven | required for affected risk domains | causal run ledger + evidence refs |

A task may need L3 verification without a long L3 document. Rigor scales independently across planning, validation, review, and trace.

## L1 delivery profiles

The skill supports three optional execution profiles:

### `demo`

Use for a pitch, prototype, or disposable experiment.

- optimize for a believable primary flow;
- local state, fixtures, and narrow mocks are acceptable;
- do not fake the product's differentiating capability;
- label simulated external behavior honestly.

### `mvp`

Default for the first usable version.

- make the core flow work end to end;
- use existing project infrastructure;
- persist real data when persistence is part of the value;
- simplify blocked non-core edges instead of generalizing them.

### `patch`

Use for a small addition or correction in an existing product.

- follow the nearest working pattern;
- keep the diff and touched surface small;
- do not redesign adjacent systems as collateral work.

Optional controls:

```text
mode: demo | mvp | patch
scope: first slice
validation: smoke | targeted | full
tests: none | targeted | required
```

Explicit controls override defaults except the safety floor.

## Task Brief

A Task Brief is the minimum shared statement of what the run is trying to achieve.

For L0/L1 it may remain internal. For L2/L3 persist it when the task spans sessions, actors, or consequential decisions.

A useful brief contains:

```text
Outcome       What should become possible?
Observable    How will we know it worked?
Boundary      What is explicitly outside this task?
Constraints   What must not be violated?
Open choices  Which decisions still require a human?
Evidence      What verification will close the task?
```

The brief is not a product requirements document by default. It exists to remove ambiguity that would otherwise affect implementation.

Before asking the human a repository question, try to answer it from repository evidence. Humans should spend attention on intent and trade-offs, not on facts the agent can inspect itself.

See [Task lifecycle](skills/human-ai/references/task-lifecycle.md).

## Context acquisition

Use the least expensive reliable source first:

1. current task and repository instructions;
2. durable project context relevant to the task;
3. structural code intelligence, if available;
4. exact symbols/files and their direct relationships;
5. focused search;
6. broad exploration only when localization failed.

A context engine may expose capabilities such as:

- `locate` — find the code that owns a concept;
- `relate` — show callers, callees, imports, implementations, or ownership edges;
- `impact` — estimate the directly affected surface;
- `orient` — restore a compact map after context compaction or handoff;
- `diagnose` — inspect the changed surface after implementation.

Gortex is one optional implementation of this pattern. Human + AI does not depend on a particular engine.

Source code and authoritative configuration outrank indexes and summaries. If an index may be stale, verify the exact implementation before changing it.

See [Context engines](skills/human-ai/references/context-engines.md).

## Durable Context

Human + AI distinguishes reusable project facts from task residue.

A project may keep a lightweight `.human-ai/context/` area:

```text
.human-ai/
  context/
    INDEX.md
    ...focused project notes when needed
  runs/
    ...optional retained run evidence
```

`INDEX.md` is a router, not a dump. It tells an agent where durable facts live, which source owns them, and when they should be loaded.

Durable context may include:

- product invariants and business rules;
- architecture boundaries that are not obvious from one file;
- project-specific conventions with real consequences;
- deployment/operations facts that cannot be safely guessed;
- material decisions and their constraints.

Do not duplicate implementation details that are easier to read from code. Do not store changing inventories where a database, manifest, registry, or configuration file already owns them.

See [Durable Context](skills/human-ai/references/durable-context.md).

## Build policy

Prefer one real vertical path:

```text
input -> differentiating action -> visible or persisted result
```

When several implementations are valid, prefer:

1. an existing project pattern;
2. an existing dependency;
3. framework-native capability;
4. a direct implementation;
5. one process before distributed coordination;
6. synchronous behavior before queues/events;
7. a narrow schema before a generic metadata system;
8. small local duplication before an abstraction without a current second use;
9. reversible defaults before a configuration framework.

Do not add an abstraction because its name sounds architectural. Add it because the current boundary requires it.

## Safety floor

Fast work still obeys minimum correctness at dangerous boundaries.

Examples:

- authorization is checked on a trusted side;
- tenant access is scoped in reads and writes;
- secrets stay outside source and client bundles;
- payment state comes from the provider's trusted confirmation;
- destructive operations target an explicit scope;
- migrations preserve existing data unless destructive behavior was explicitly authorized;
- external publication, outbound messages, and irreversible actions require explicit permission.

See [High-risk boundaries](skills/human-ai/references/high-risk.md).

## Verification

Choose the smallest boundary that can actually fail for the changed contract.

Typical choices:

- local UI/glue behavior -> targeted interaction or smoke check;
- deterministic business rule -> focused unit check;
- database/API/service contract -> integration check;
- journey requiring the real stack -> E2E;
- boot/deploy wiring -> smoke.

Do not test the same risk at multiple levels merely to complete a pyramid.

For visual changes, verification may need rendered evidence rather than a successful build. See [Visual evidence](skills/human-ai/references/visual-evidence.md).

## Independent Pass

An Independent Pass is a fresh review context used when the cost of self-confirmation is material.

Default policy:

- L0: normally skip;
- L1: use only when risk or uncertainty warrants it;
- L2: recommended for material implementation;
- L3: required for the risk domains actually touched.

The independent reviewer receives the Task Brief, changed revision/diff, relevant project contracts, and verification evidence. It should not depend on the builder's narrative of why the code is correct.

A valid concern identifies:

- where the problem exists;
- what observable evidence supports it;
- which agreed behavior or project contract it conflicts with;
- when the problem can occur;
- what consequence follows.

A concern is diagnosis, not authorization. The builder may make a local correction that is already inside the task. Anything that changes product behavior, architecture, data contracts, or material scope returns to the human.

Run one fresh pass after implementation. If accepted fixes materially changed the reviewed behavior, one follow-up pass is normally enough. Then stop and expose unresolved concerns instead of creating a review loop.

See [Independent Pass](skills/human-ai/references/independent-pass.md).

## Run Ledger

For material work, a Run Ledger records observable engineering events without storing private reasoning.

A causal event can contain:

```json
{
  "run_id": "run_2026_09_15_01",
  "event_id": "e17",
  "parent_event_id": "e12",
  "time": "2026-09-15T18:41:12Z",
  "actor": "builder",
  "runtime": "codex",
  "action": "edit",
  "target": "src/import.ts",
  "decision": "reuse existing validation schema",
  "input_refs": ["symbol:parseImport"],
  "output_refs": ["diff:src/import.ts"],
  "evidence_refs": ["check:import-integration"],
  "status": "success",
  "metrics": {"duration_ms": 1840, "input_tokens": 2410, "output_tokens": 380}
}
```

The event model allows multiple actors and tools to be connected through parent references. It records what happened and what evidence was produced, not hidden model thoughts.

See [Run Ledger](skills/human-ai/references/run-ledger.md).

## Closeout

Closeout is the end of a meaningful task, not a separate bureaucracy step.

Before finishing:

1. compare the delivered behavior with the Task Brief or inferred outcome;
2. record material deviations or unresolved blockers;
3. verify the agreed evidence boundary;
4. promote only genuinely reusable facts into Durable Context;
5. keep or discard run artifacts according to project policy;
6. stop instead of continuing into optional polish.

A task should not leave current project truth trapped only inside a transient run log.

## Writing provenance

When generating specs, architectural notes, reports, or other source-bound documentation:

- distinguish observed facts from human decisions;
- keep inferences marked as inferences;
- preserve unknowns instead of inventing a clean explanation;
- do not create causal links that the evidence does not support;
- do not strengthen the human's confidence beyond what was actually stated.

This rule applies regardless of language. Russian public-facing prose may additionally use Slopotron as an editorial tool.

See [Writing provenance](skills/human-ai/references/provenance.md).

## Stop rules

Stop when the promised outcome is complete and verified at the required boundary.

Do not automatically continue into cleanup, refactoring, generalized architecture, extra test layers, documentation expansion, or speculative edge cases.

If the same class of implementation or verification failure occurs twice without new evidence, change the approach, narrow the task, or expose the blocker.

## Evals

Evaluate execution behavior, not how polished the final explanation sounds.

Useful measures include:

- time and tokens before the first meaningful edit;
- raw reads and broad searches;
- repeated reads of unchanged material;
- primary outcome completeness;
- unnecessary abstraction or infrastructure;
- unnecessary test work;
- honesty about mocks and blockers;
- quality of verification;
- correctness of scope decisions;
- whether durable context was updated only when warranted;
- whether an independent pass found issues the builder missed.

Behavioral scenarios live in [`skills/human-ai/EVALS.md`](skills/human-ai/EVALS.md).

## Runtime neutrality

The framework belongs to no single coding-agent runtime.

Canonical behavior lives in portable Agent Skills and plain project files. Runtime-specific integration should remain thin enough to replace without changing the framework's model.
