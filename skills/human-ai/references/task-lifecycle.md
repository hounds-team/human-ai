# Task lifecycle

Use this reference for L2/L3 work or any task whose important decisions must survive the current turn.

## 1. Establish the Task Brief

Keep it short enough to read before implementation.

```text
Outcome       What should become possible?
Observable    What evidence will show success?
Boundary      What is not part of this task?
Constraints   Which project/safety rules matter?
Open choices  Which decisions still belong to the human?
Evidence      Which checks will close the task?
```

Do not ask the human to describe repository facts that can be inspected reliably.

## 2. Resolve only blocking uncertainty

Research the current code and contracts first. Then ask about choices that materially affect behavior, data, architecture, irreversible effects, or scope.

Do not turn optional edge cases into mandatory requirements without a decision.

## 3. Pass the Contract Gate

For L1/L2/L3 work, write typed interfaces, schemas, or function signatures first. Ensure the boundary is deep and minimal before filling in implementation. See [Code taste](code-taste.md).

## 4. Execute against the brief

Build the narrowest implementation that satisfies the outcome, contracts, and constraints.

If new evidence invalidates the brief, stop at the decision boundary. Local corrections that preserve the agreed behavior are allowed; new behavior is not implied by discovery.

## 5. Pass Quality Gates

Before passing to functional verification, run the project's configured deterministic quality gates ([Dev Quality Gates](https://github.com/mokevnin/dev-quality-gates)):
- run fast native toolchains (Ruff, Oxlint, jactionlint, rumdl);
- enforce non-zero exit codes for all violations without ignoring warnings;
- leverage machine diagnostics and `--fix` for autonomous self-correction.

## 6. Verify

Run the evidence named in the brief or the smallest reliable substitute if the planned check is unavailable.

Record why a substitute is adequate.

## 7. Simplify and Deepen

Before passing to review or closeout, conduct a code-taste pass: remove shallow wrappers, prune redundant branches, and ensure modules remain deep. Verify tests remain green.

## 8. Independent Pass when warranted

Use a fresh review context for L2 material work and L3 affected risk domains.

The reviewer should evaluate the actual revision and evidence, not trust the builder's summary.

## 9. Closeout

Before handoff:

- compare the result with the brief;
- list unresolved material deviations;
- promote reusable facts to Durable Context only when they will matter again;
- leave transient implementation detail in code/history rather than permanent documentation.
