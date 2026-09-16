#!/usr/bin/env bash
set -euo pipefail

ROOT="${1:-$PWD}"
TARGET="$ROOT/.human-ai/context"

mkdir -p "$TARGET" "$ROOT/.human-ai/runs"

if [[ ! -f "$TARGET/INDEX.md" ]]; then
  cat > "$TARGET/INDEX.md" <<'EOF'
# Durable Context Router

Keep only project facts that should improve decisions across unrelated future tasks.

## Routes

| Topic | Load when | Owner/source |
|---|---|---|
| Product rules | Add a link when needed | — |
| System boundaries | Add a link when needed | — |
| Project conventions | Add a link when needed | — |
| Operations/recovery | Add a link when needed | — |

## Rules

- Link to authoritative code/configuration when possible.
- Do not duplicate volatile inventories or implementation detail.
- Add a new note only when it forms a useful context boundary.
EOF
  echo "Created $TARGET/INDEX.md"
else
  echo "Exists: $TARGET/INDEX.md"
fi
