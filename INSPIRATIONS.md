# Inspirations and boundaries

Human + AI is an original synthesis built from internal workflow experiments and public ideas from the broader coding-agent ecosystem.

This file makes the boundary explicit: we cite projects that influenced our thinking, but Human + AI does not reuse their prose, file layouts, role names, workflow taxonomies, or agent definitions unless a future contribution is explicitly marked as third-party material with its license.

As of v0.4, this repository does not vendor source code from the projects below.

## Gortex

- https://gortex.dev/
- https://gortex.dev/docs

What influenced us:

- structural localization before broad repository reading;
- code-relationship and impact analysis as context-compression tools;
- restoring compact orientation after context loss;
- post-change structural diagnostics.

Human + AI generalizes these ideas as optional **context-engine capabilities**. Gortex is a recommended implementation, not a framework dependency.

## AI-First Development Framework by Pavel Molyanov

- https://github.com/pavel-molyanov/molyanov-ai-dev

What influenced us:

- scaling process to the task instead of forcing one workflow everywhere;
- keeping long-lived project facts separate from transient task artifacts;
- using fresh review contexts for meaningful verification;
- refusing to let review findings silently enlarge user scope;
- treating tests as protection for concrete behavior rather than a coverage ritual.

Human + AI uses a different composition and vocabulary: Durable Context, Task Brief, Independent Pass, Run Ledger, and Closeout. It does not reproduce Molyanov's user-spec lifecycle, Project Knowledge layout, reviewer taxonomy, Claude/Codex source hierarchy, or feature-folder workflow.

The referenced project is MIT-licensed. If Human + AI ever incorporates its source code rather than merely ideas, the required copyright and license notice must be preserved.

## Trace Engineering article

- https://x.com/uncleshampoO/status/2099505399644684655

What influenced us:

- distinguishing individual events from an actor trajectory and a cross-actor trace;
- treating observability of agent work as an engineering input rather than merely debug logging.

Human + AI expresses this through its own Run Ledger event model and causal parent references. It explicitly excludes private chain-of-thought.

## Slopotron

- https://github.com/beaverbeard/slopotron

What influenced us:

- checking source provenance before polishing language;
- avoiding unsupported causal links or stronger conclusions than the source warrants;
- treating editorial cleanup as a separate pass from semantic correctness.

Human + AI generalizes provenance rules to generated engineering documentation. Slopotron remains an optional editorial tool for Russian public-facing prose, not a runtime dependency.

Slopotron is MIT-licensed. If its source is ever copied into this repository, its license notice must travel with that code.

## Agent Skills

Human + AI uses the public Agent Skills format where supported by coding agents.

Relevant runtime documentation:

- Codex: https://developers.openai.com/codex/
- Claude Code: https://code.claude.com/docs/en/skills
- Pi: https://pi.dev/docs/latest/skills
- Gemini CLI: https://github.com/google-gemini/gemini-cli/blob/main/docs/cli/skills.md
- OpenCode: https://opencode.ai/docs/skills

## Contribution rule

When adding a new external reference:

1. record the source here;
2. describe the idea in our own words;
3. redesign it to fit Human + AI rather than cloning its surrounding workflow;
4. do not copy prose, prompts, agent definitions, or directory structures by convenience;
5. if actual third-party code or text is incorporated, include the required license/attribution beside it.
