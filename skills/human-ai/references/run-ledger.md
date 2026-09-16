# Run Ledger

A Run Ledger is a machine-readable record of observable engineering events.

It exists for debugging, evals, handoff, and process improvement—not to capture private reasoning.

## Event model

JSONL is a convenient default because events can be appended incrementally.

```json
{"run_id":"run_01","event_id":"e1","parent_event_id":null,"time":"2026-09-15T18:40:00Z","actor":"human","action":"request","target":null,"status":"success"}
{"run_id":"run_01","event_id":"e2","parent_event_id":"e1","time":"2026-09-15T18:40:04Z","actor":"builder","action":"localize","target":"project creation flow","status":"success"}
{"run_id":"run_01","event_id":"e3","parent_event_id":"e2","time":"2026-09-15T18:41:12Z","actor":"builder","action":"edit","target":"src/projects/create.ts","decision":"reuse existing validation schema","evidence_refs":["diff:src/projects/create.ts"],"status":"success"}
```

Useful optional fields:

- `runtime`;
- `input_refs`;
- `output_refs`;
- `evidence_refs`;
- `duration_ms`;
- token counts when exposed by the runtime;
- error category;
- external action identifier.

## Causality

`parent_event_id` links events into a causal graph across humans, builders, reviewers, and tools.

An event log is a list of observations. An actor trajectory is the ordered path taken by one actor. A run trace is the connected set of causal events across actors.

## What to record

Prefer events that explain engineering state changes:

- task/permission boundary;
- localization or impact discovery that changed the approach;
- material implementation decisions;
- edits or external actions;
- verification and observed results;
- independent-review concerns and disposition;
- blockers and stop conditions.

Do not log every file read by default unless context-efficiency evaluation needs it.

## Privacy boundary

Never store private chain-of-thought or hidden model reasoning.

A `decision` field should contain a short externally useful rationale such as "reuse existing tenant guard" rather than an internal reasoning transcript.
