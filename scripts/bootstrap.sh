#!/usr/bin/env bash
set -euo pipefail

REPO_URL="${HUMAN_AI_REPO_URL:-https://github.com/hounds-team/human-ai.git}"
REF="${HUMAN_AI_REF:-main}"
TMP_DIR="$(mktemp -d "${TMPDIR:-/tmp}/human-ai.XXXXXX")"

cleanup() {
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

if ! command -v git >/dev/null 2>&1; then
  echo "git is required to install Human + AI." >&2
  exit 1
fi

git clone --quiet --depth 1 --branch "$REF" "$REPO_URL" "$TMP_DIR/repo"
exec "$TMP_DIR/repo/scripts/install.sh" "$@"
