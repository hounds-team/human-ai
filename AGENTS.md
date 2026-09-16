# Human + AI repository instructions

This repository defines the Human + AI framework itself.

## Language

- Canonical framework text, skill instructions, scripts, and technical documentation: English.
- README translations may exist in other languages.
- Translations must not introduce requirements that do not exist in canonical English sources.

## Authority

When editing this repository, preserve this order:

1. explicit maintainer request;
2. `MANIFESTO.md` principles;
3. `FRAMEWORK.md` operating model;
4. the portable skill under `skills/human-ai/`;
5. supporting docs and translations.

If two files disagree, fix the lower-authority file rather than silently changing the framework's meaning.

## Originality boundary

External references are inspirations, not templates.

When learning from an external framework or repository:

- extract the underlying problem and observable benefit;
- restate the mechanism independently;
- redesign terminology, composition, file layout, and workflow to fit Human + AI;
- do not copy prose, prompts, role names, agent definitions, checklists, or directory structures verbatim;
- do not mechanically rename a foreign workflow while preserving it step-for-step;
- record the inspiration in `INSPIRATIONS.md` when it materially shaped the framework;
- if third-party code or substantial text is actually incorporated, preserve its license and attribution beside the incorporated material.

## Scope

Make the smallest change that satisfies the maintainer request.

Do not add an orchestrator, server, dashboard, database, telemetry backend, CI platform, or agent swarm unless a real observed need justifies it.

## Framework maintenance

The skill should stay compact. Put conditional detail in `skills/human-ai/references/` and load it only when relevant.

A new policy should normally have at least one of:

- a concrete failure observed in real use;
- an eval that reproduces the failure;
- a safety requirement that cannot reasonably wait for empirical failure.

Do not add rules only because another framework has them.

When evaluating framework behavior, treat unnecessary user-visible execution narration as a defect. Correctness does not excuse repeated task restatement, tool-choice monologues, or routine retry commentary.

## Editing canonical text

When updating docs from source material:

- preserve uncertainty;
- distinguish observed facts, maintainer decisions, and inference;
- do not invent causal links for smoother prose;
- do not strengthen claims beyond their source.

Russian public-facing text may be checked with Slopotron after semantic accuracy is established.

## Validation

Before release, run:

```bash
./scripts/check.sh
```

Do not claim a runtime is supported if its installation path was not exercised by the local install matrix.
