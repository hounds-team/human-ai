#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

echo "[1/5] shell syntax"
for f in scripts/*.sh skills/human-ai/scripts/*.sh; do
  bash -n "$f"
done

echo "[2/5] skill validation"
if command -v skills-ref >/dev/null 2>&1; then
  skills-ref validate skills/human-ai
else
  echo "skills-ref not installed; skipping spec validator"
fi

echo "[3/5] markdown links and originality guard"
python - <<'PY'
from pathlib import Path
import re, sys
root=Path('.').resolve()
errors=[]
link_re=re.compile(r'\[[^\]]+\]\(([^)]+)\)')
for md in root.rglob('*.md'):
    text=md.read_text(encoding='utf-8')
    for raw in link_re.findall(text):
        target=raw.strip().split('#',1)[0]
        if not target or target.startswith(('http://','https://','mailto:','#')):
            continue
        p=(md.parent/target).resolve()
        try:
            p.relative_to(root)
        except ValueError:
            errors.append(f'{md}: link escapes repo: {raw}')
            continue
        if not p.exists():
            errors.append(f'{md}: missing link target: {raw}')

# Terms from retired/internal or external workflow structures should not leak into canonical policy.
# INSPIRATIONS.md is intentionally allowed to name referenced concepts for attribution.
blocked=[
    'founder-mvp',
    'work/completed/',
]
for p in root.rglob('*'):
    if not p.is_file() or p.name in {'INSPIRATIONS.md'} or p.as_posix().endswith('/scripts/check.sh') or '.git' in p.parts:
        continue
    try: text=p.read_text(encoding='utf-8')
    except UnicodeDecodeError: continue
    low=text.lower()
    for term in blocked:
        if term.lower() in low:
            errors.append(f'{p}: retired/external structure term found: {term}')

if errors:
    print('\n'.join(errors))
    sys.exit(1)
print('markdown/originality checks passed')
PY

echo "[4/5] installation matrix"
TMP="$(mktemp -d "${TMPDIR:-/tmp}/human-ai-check.XXXXXX")"
trap 'rm -rf "$TMP"' EXIT
mkdir -p "$TMP/home" "$TMP/project"
for agent in codex claude pi gemini opencode all; do
  HOME="$TMP/home" ./scripts/install.sh --agent "$agent" --scope user >/dev/null
  ./scripts/install.sh --agent "$agent" --scope project --project-dir "$TMP/project" >/dev/null
  HOME="$TMP/home" ./scripts/uninstall.sh --agent "$agent" --scope user >/dev/null
  ./scripts/uninstall.sh --agent "$agent" --scope project --project-dir "$TMP/project" >/dev/null
done

echo "[5/5] bundled context initializer"
"$ROOT/skills/human-ai/scripts/init-context.sh" "$TMP/project" >/dev/null
test -f "$TMP/project/.human-ai/context/INDEX.md"

echo "Human + AI checks passed."
