#!/usr/bin/env bash
set -euo pipefail

AGENT=""
SCOPE="user"
PROJECT_DIR="${PWD}"

usage() {
  cat <<'EOF'
Usage:
  ./scripts/uninstall.sh --agent codex|claude|pi|gemini|opencode|all [--scope user|project] [--project-dir PATH]
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --agent) AGENT="${2:-}"; shift 2 ;;
    --scope) SCOPE="${2:-}"; shift 2 ;;
    --project-dir) PROJECT_DIR="${2:-}"; shift 2 ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown argument: $1" >&2; usage >&2; exit 2 ;;
  esac
done

if [[ -z "$AGENT" ]]; then echo "--agent is required" >&2; exit 2; fi
case "$AGENT" in codex|claude|pi|gemini|opencode|all) ;; *) echo "Unsupported agent: $AGENT" >&2; exit 2 ;; esac
case "$SCOPE" in user|project) ;; *) echo "Unsupported scope: $SCOPE" >&2; exit 2 ;; esac

common_dest() {
  if [[ "$SCOPE" == "user" ]]; then printf '%s\n' "$HOME/.agents/skills"; else printf '%s\n' "$(cd "$PROJECT_DIR" && pwd)/.agents/skills"; fi
}
claude_dest() {
  if [[ "$SCOPE" == "user" ]]; then printf '%s\n' "$HOME/.claude/skills"; else printf '%s\n' "$(cd "$PROJECT_DIR" && pwd)/.claude/skills"; fi
}
remove_skill() {
  local dest="$1"
  rm -rf "$dest/human-ai"
  echo "Removed Human + AI from: $dest/human-ai"
}

case "$AGENT" in
  claude) remove_skill "$(claude_dest)" ;;
  codex|pi|gemini|opencode) remove_skill "$(common_dest)" ;;
  all) remove_skill "$(common_dest)"; remove_skill "$(claude_dest)" ;;
esac
