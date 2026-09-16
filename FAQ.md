# FAQ

## What is Human + AI?

Human + AI is a portable engineering framework for humans working with coding agents. It tries to make delivery fast without making scope, context, evidence, or safety implicit.

It is not a coding agent and not an orchestration server.

## Is this a fork of another agent framework?

No.

We study public approaches to agent engineering, extract problems and useful mechanisms, and redesign them around Human + AI's own operating model. External prose, role names, directory layouts, agent definitions, and workflow taxonomies are not used as templates.

See [INSPIRATIONS.md](INSPIRATIONS.md).

## Is this just vibe coding with extra rules?

No.

Fast work is allowed, but the differentiating core must be real, the result must be verified at a meaningful boundary, and dangerous operations retain a safety floor.

## Does every task need a Task Brief?

No.

L0 and most L1 work can keep the brief implicit. Persist it for L2/L3 when ambiguity, multiple actors, long-running work, or consequential decisions make a shared contract useful.

## Why not ask me questions first?

The agent should first inspect repository evidence for repository facts.

Human attention is more valuable for product intent, priorities, trade-offs, acceptable limitations, and authorization. If the answer is reliably in the code, the agent should usually find it itself.

## What is Durable Context?

Durable Context is a small set of project facts that should help with unrelated future tasks: invariants, boundaries, operational facts, and material decisions.

It is not a generated wiki and should not duplicate implementation details from the codebase.

## Is `.human-ai/context` required?

No.

Small or short-lived projects may not need it. Create it only when recurring work benefits from reusable project context.

## What is a Run Ledger?

A Run Ledger is a machine-readable record of observable engineering events: task boundary, material decisions, edits/actions, checks, results, blockers, and optional runtime metrics.

It can connect events from humans, builders, reviewers, and tools through parent references.

## Does the Run Ledger contain chain-of-thought?

No.

Private model reasoning is explicitly outside the trace format. Only externally useful engineering events and short material rationales belong there.

## Why is the agent so quiet while it works?

That is intentional. Human + AI treats human attention as a budget. Routine tool selection, retries, internal debate, and repeated task summaries are execution noise, not progress. The agent should interrupt only for a material decision, a blocker, a useful milestone, or the final handoff.

## Does Human + AI expose chain-of-thought?

No. Preserve observable evidence, decisions, checks, and outcomes instead. Private reasoning is neither a project artifact nor a user-facing progress report.

## Does Human + AI require Gortex?

No.

Gortex is a recommended optional context engine. Human + AI can fall back to targeted source reads and normal repository search.

## Why use a context engine?

To localize relevant code and relationships before spending tokens on broad raw reads. The source code remains authoritative.

## What if the code-intelligence index is stale?

Treat it as navigation, not truth. Verify the exact current source/configuration before editing.

## Does every task need tests?

No.

Verification protects a concrete contract or risk. A smoke interaction can be enough for a simple UI change; database, authorization, payment, or migration behavior may require stronger evidence.

## Does every task need independent review?

No.

L0 usually does not. L1 uses it by risk. L2 material work should normally get a fresh Independent Pass. L3 requires one for the risk domains that changed.

## Why must the review context be fresh?

A builder can inherit its own assumptions. A reviewer that receives the task boundary, actual revision, project contracts, and evidence can challenge those assumptions without inheriting the whole authoring narrative.

## Can a reviewer expand the task?

No.

A concern is diagnostic evidence. If the correction changes product behavior, architecture, data contracts, or material scope, the human decides whether it becomes new work.

## Why limit review loops?

Perfect convergence can consume unbounded context without improving the product. Human + AI normally allows one fresh pass and one follow-up after material fixes, then exposes remaining concerns.

## What are `demo`, `mvp`, and `patch`?

They are L1 delivery profiles:

- `demo` — believable primary flow with explicit simulation at non-core edges;
- `mvp` — first usable end-to-end version;
- `patch` — smallest change that fits an existing product.

## Can Human + AI be installed in an existing repository?

Yes.

Project-scoped installation places only the `human-ai` Agent Skill in the relevant agent skill directory. It does not overwrite application code, package manifests, or repository instructions.

## Which agents are supported?

The installer currently targets Codex, Claude Code, Pi, Gemini CLI, and OpenCode.

## How do I invoke it?

**Codex**

```text
$human-ai Ship the first usable slice. mode: mvp.
```

**Claude Code**

```text
/human-ai Ship the first usable slice. mode: mvp.
```

**Pi**

```text
/skill:human-ai
```

For Gemini CLI and OpenCode, ask the runtime to use the `human-ai` skill after installation/discovery.

## Is Slopotron required?

No.

Its provenance-first editorial approach influenced Human + AI's writing rules. Slopotron itself remains an optional tool for Russian public-facing prose.

## Does Human + AI include an orchestrator or multi-agent swarm?

No, by design.

The framework currently defines behavior, context, evidence, review, and evals. An orchestration layer should be added only after recurring real-world failures show what it must solve.

## How do you avoid copying the reference projects?

`AGENTS.md` contains an explicit originality boundary for maintainers and coding agents. We preserve attribution in `INSPIRATIONS.md`, but new Human + AI mechanisms must be restated and recomposed independently rather than imported step-for-step.

If third-party code or substantial text is ever incorporated, it must carry the license and attribution required by its source.
