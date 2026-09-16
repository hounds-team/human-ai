# High-risk boundaries

Use these minimums only when the task touches the named boundary. Do not expand a narrow task into a general audit.

## Authorization and tenancy

- enforce authorization on a trusted/server boundary;
- scope reads and writes to the authorized subject/tenant;
- do not trust a client-provided tenant/user identifier without verification;
- verify negative access when the change could expose cross-tenant data.

## Secrets

- keep credentials out of source, logs, and client bundles;
- use the project's existing secret/config mechanism;
- never ask the user to paste production secrets into prompts when another secure path exists.

## Payments

- do not infer successful payment from local UI state;
- use the provider's trusted confirmation mechanism;
- make idempotency/retry handling proportional to the provider flow actually being implemented;
- do not silently broaden a payment task into a billing platform.

## Destructive operations

- identify the exact target before deletion/mutation;
- require explicit authorization for irreversible or externally visible operations;
- add confirmation or recovery only where the real risk warrants it.

## Migrations

- prefer additive/backward-compatible change when practical;
- do not silently discard existing data;
- expose destructive or difficult-to-reverse changes before execution;
- verify the migration at the narrowest realistic boundary.

## Outbound actions

Sending messages, publishing content, merging/pushing to protected branches, charging money, or triggering irreversible external effects requires explicit permission when that permission is not already part of the user's request.
