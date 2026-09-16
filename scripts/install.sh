#!/usr/bin/env bash
set -euo pipefail

AGENT=""
SCOPE="user"
PROJECT_DIR="${PWD}"

usage() {
  cat <<'EOF'
Usage:
  ./scripts/install.sh --agent codex|claude|pi|gemini|opencode|all [--scope user|project] [--project-dir PATH]

Examples:
  ./scripts/install.sh --agent codex --scope user
  ./scripts/install.sh --agent claude --scope project --project-dir ~/src/app
  ./scripts/install.sh --agent all --scope user
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

if [[ -z "$AGENT" ]]; then
  echo "--agent is required" >&2
  usage >&2
  exit 2
fi

case "$AGENT" in codex|claude|pi|gemini|opencode|all) ;; *) echo "Unsupported agent: $AGENT" >&2; exit 2 ;; esac
case "$SCOPE" in user|project) ;; *) echo "Unsupported scope: $SCOPE" >&2; exit 2 ;; esac

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

install_skill() {
  local dest="$1"
  mkdir -p "$dest"
  rm -rf "$dest/human-ai"
  cp -R "$REPO_ROOT/skills/human-ai" "$dest/human-ai"
  echo "Installed Human + AI into: $dest/human-ai"
}

common_dest() {
  if [[ "$SCOPE" == "user" ]]; then printf '%s\n' "$HOME/.agents/skills"; else printf '%s\n' "$(cd "$PROJECT_DIR" && pwd)/.agents/skills"; fi
}

claude_dest() {
  if [[ "$SCOPE" == "user" ]]; then printf '%s\n' "$HOME/.claude/skills"; else printf '%s\n' "$(cd "$PROJECT_DIR" && pwd)/.claude/skills"; fi
}

if [[ "$SCOPE" == "project" && ! -d "$PROJECT_DIR" ]]; then
  echo "Project directory does not exist: $PROJECT_DIR" >&2
  exit 2
fi

case "$AGENT" in
  claude) install_skill "$(claude_dest)"; echo "Invoke in Claude Code: /human-ai" ;;
  codex) install_skill "$(common_dest)"; echo 'Invoke in Codex: $human-ai' ;;
  pi) install_skill "$(common_dest)"; echo "Invoke in Pi: /skill:human-ai" ;;
  gemini) install_skill "$(common_dest)"; echo "Gemini CLI: run /skills reload, then /skills list" ;;
  opencode) install_skill "$(common_dest)"; echo "OpenCode will discover Human + AI from .agents/skills" ;;
  all)
    install_skill "$(common_dest)"
    install_skill "$(claude_dest)"
    echo "Installed shared Agent Skill plus Claude Code compatibility copy."
    ;;
esac
