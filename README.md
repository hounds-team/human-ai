# Human + AI

**A risk-scaled engineering framework for humans working with coding agents.**

[Русский](README.ru.md) · [简体中文](README.zh-CN.md)

Human + AI is for the point where giving an agent a task is easy, but keeping delivery fast, scoped, inspectable, and safe is not.

It provides one portable operating skill for coding agents:

- deliver the narrowest real user outcome;
- scale planning and review to uncertainty and risk;
- spend repository context deliberately;
- ask humans for decisions, not facts the code can answer;
- keep the differentiating product behavior real;
- leave inspectable evidence without storing private chain-of-thought;
- retain only project context that will matter again;
- turn repeated agent failures into evals before adding more policy.

The framework is runtime-neutral. The same core skill can be installed for Codex, Claude Code, Pi, Gemini CLI, and OpenCode.

## The operating loop

```text
intent
  -> triage
  -> context
  -> task brief
  -> build
  -> verify
  -> independent pass when justified
  -> closeout
  -> durable context
  -> evals
```

Not every task uses every step.

## Task levels

| Level | Typical work | Default process |
|---|---|---|
| L0 Quick | obvious local fix | direct edit + targeted check |
| L1 Ship | MVP, demo, narrow feature | compact outcome + vertical delivery + smoke/targeted verification |
| L2 Planned | ambiguity, cross-cutting behavior, meaningful trade-off | Task Brief + targeted verification + independent pass |
| L3 Guarded | authorization, tenancy, payments, destructive actions, sensitive data, risky migrations | explicit risk notes + risk-driven verification + independent pass |

Rigor scales by dimension. A task can need stronger security verification without needing a long planning document.

## Delivery profiles

For L1 work:

```text
mode: demo | mvp | patch
validation: smoke | targeted | full
tests: none | targeted | required
```

- `demo` — convincing primary flow; narrow mocks/fixtures are allowed at non-core edges.
- `mvp` — first usable end-to-end version; the default.
- `patch` — smallest change that fits the existing product.

## Context economy

Human + AI prefers:

```text
locate -> inspect relationships/impact -> read exact source -> edit -> diagnose
```

over repository-wide scanning.

[Gortex](https://gortex.dev/) is a recommended optional context engine. Human + AI remains usable without it.

## Durable Context

For projects that benefit from cross-session context, Human + AI can use a small router under:

```text
.human-ai/context/INDEX.md
```

Initialize the skeleton from an installed skill or repository clone:

```bash
skills/human-ai/scripts/init-context.sh
```

The router should point to durable project facts, not duplicate the codebase.

## Run Ledger

Material work can record causal engineering events as JSONL: actors, actions, changed artifacts, evidence, status, and optional timing/token metrics.

Run Ledger records observable events. It does **not** store private chain-of-thought.

## Install

The installer adds one Agent Skill: `human-ai`.

### Codex

```bash
curl -fsSL https://raw.githubusercontent.com/hounds-team/human-ai/main/scripts/bootstrap.sh | bash -s -- --agent codex --scope user
```

Use:

```text
$human-ai Ship the first usable slice. mode: mvp.
```

### Claude Code

```bash
curl -fsSL https://raw.githubusercontent.com/hounds-team/human-ai/main/scripts/bootstrap.sh | bash -s -- --agent claude --scope user
```

Use:

```text
/human-ai Ship the first usable slice. mode: mvp.
```

### Pi

```bash
curl -fsSL https://raw.githubusercontent.com/hounds-team/human-ai/main/scripts/bootstrap.sh | bash -s -- --agent pi --scope user
```

Use:

```text
/skill:human-ai
```

Pi can also install the repository directly:

```bash
pi install git:github.com/hounds-team/human-ai
```

### Gemini CLI

```bash
curl -fsSL https://raw.githubusercontent.com/hounds-team/human-ai/main/scripts/bootstrap.sh | bash -s -- --agent gemini --scope user
```

Then reload/list skills in Gemini CLI.

### OpenCode

```bash
curl -fsSL https://raw.githubusercontent.com/hounds-team/human-ai/main/scripts/bootstrap.sh | bash -s -- --agent opencode --scope user
```

### All supported agents

```bash
curl -fsSL https://raw.githubusercontent.com/hounds-team/human-ai/main/scripts/bootstrap.sh | bash -s -- --agent all --scope user
```

For project-local installation replace `--scope user` with `--scope project`.

See [Installation](docs/INSTALL.md).

## Repository map

```text
MANIFESTO.md                 principles
FRAMEWORK.md                 operating model
FAQ.md                       common questions
INSPIRATIONS.md              attribution and originality boundary
NOTICE.md                    third-party notice
AGENTS.md                    maintenance rules for this repository
skills/human-ai/             portable Agent Skill
scripts/                     installer and release checks
docs/INSTALL.md              installation details
```

## Originality and attribution

Human + AI is an original synthesis. We study public agent-engineering projects, but external work is treated as inspiration rather than a template.

We do not copy their prose, agent definitions, directory layouts, or workflow taxonomies by default. If third-party code or substantial text is ever incorporated, it must be identified with its required license and attribution.

See [INSPIRATIONS.md](INSPIRATIONS.md) and [NOTICE.md](NOTICE.md).

## Status

**v0.4 — early and intentionally lightweight.**

The framework should earn new complexity from observed failures, not from a desire to look complete.
