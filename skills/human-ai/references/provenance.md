# Writing provenance

Use this reference when an agent turns source material into durable engineering prose: a Task Brief, architecture note, incident summary, decision record, report, or project context.

## Classify statements

A statement should be traceable to one of four categories:

- **Observed** — supported by code, configuration, runtime output, or supplied source material.
- **Decided** — explicitly chosen by the human or already established by project policy.
- **Inferred** — a useful interpretation that is not directly stated by the source.
- **Unknown** — information the current evidence does not establish.

Do not present inferred or unknown material as observed fact.

## Avoid synthetic coherence

Do not add a cause merely because two facts appear together.

Do not turn a rough set of examples into an exhaustive taxonomy unless the source supports that taxonomy.

Do not replace "we do not know" with a polished explanation.

Do not make the conclusion stronger than the source or maintainer decision.

## Editing order

1. establish semantic fidelity to the source;
2. mark or resolve unsupported claims;
3. only then improve clarity and style.

For Russian public-facing prose, Slopotron may be used as an optional final editorial pass after semantic fidelity is established.
