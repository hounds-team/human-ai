# Installation

Human + AI ships as one portable Agent Skill: `human-ai`.

## One-line bootstrap

Replace `<agent>` with `codex`, `claude`, `pi`, `gemini`, `opencode`, or `all`.

```bash
curl -fsSL https://raw.githubusercontent.com/hounds-team/human-ai/main/scripts/bootstrap.sh | bash -s -- --agent <agent> --scope user
```

For project-local installation:

```bash
curl -fsSL https://raw.githubusercontent.com/hounds-team/human-ai/main/scripts/bootstrap.sh | bash -s -- --agent <agent> --scope project
```

Project scope writes into the current repository.

## Codex CLI

User scope:

```bash
curl -fsSL https://raw.githubusercontent.com/hounds-team/human-ai/main/scripts/bootstrap.sh | bash -s -- --agent codex --scope user
```

Project scope:

```bash
curl -fsSL https://raw.githubusercontent.com/hounds-team/human-ai/main/scripts/bootstrap.sh | bash -s -- --agent codex --scope project
```

Installed path:

- user: `~/.agents/skills/human-ai/`
- project: `.agents/skills/human-ai/`

Invoke:

```text
$human-ai
```

## Claude Code

User scope:

```bash
curl -fsSL https://raw.githubusercontent.com/hounds-team/human-ai/main/scripts/bootstrap.sh | bash -s -- --agent claude --scope user
```

Project scope:

```bash
curl -fsSL https://raw.githubusercontent.com/hounds-team/human-ai/main/scripts/bootstrap.sh | bash -s -- --agent claude --scope project
```

Installed path:

- user: `~/.claude/skills/human-ai/`
- project: `.claude/skills/human-ai/`

Invoke:

```text
/human-ai
```

## Pi

Direct package installation:

```bash
pi install git:github.com/hounds-team/human-ai
```

Project-local Pi installation:

```bash
pi install -l git:github.com/hounds-team/human-ai
```

The cross-agent bootstrap installer is also available.

Installed path with bootstrap:

- user: `~/.agents/skills/human-ai/`
- project: `.agents/skills/human-ai/`

Invoke:

```text
/skill:human-ai
```

## Gemini CLI

```bash
curl -fsSL https://raw.githubusercontent.com/hounds-team/human-ai/main/scripts/bootstrap.sh | bash -s -- --agent gemini --scope user
```

Project scope uses the same command with `--scope project`.

Installed path:

- user: `~/.agents/skills/human-ai/`
- project: `.agents/skills/human-ai/`

Reload/list skills in Gemini CLI after installation if needed.

## OpenCode

```bash
curl -fsSL https://raw.githubusercontent.com/hounds-team/human-ai/main/scripts/bootstrap.sh | bash -s -- --agent opencode --scope user
```

Project scope uses the same command with `--scope project`.

Installed path:

- user: `~/.agents/skills/human-ai/`
- project: `.agents/skills/human-ai/`

## All supported agents

```bash
curl -fsSL https://raw.githubusercontent.com/hounds-team/human-ai/main/scripts/bootstrap.sh | bash -s -- --agent all --scope user
```

This installs a shared Agent Skill plus a Claude-compatible copy.

## Manual installation

```bash
git clone https://github.com/hounds-team/human-ai.git
cd human-ai
./scripts/install.sh --agent codex --scope user
```

Use `--project-dir /path/to/repo` with project scope when the target is not the current directory.

## Optional: initialize Durable Context

From the repository clone:

```bash
./skills/human-ai/scripts/init-context.sh /path/to/project
```

Or let an installed Human + AI skill run its bundled `scripts/init-context.sh` when recurring project work actually needs Durable Context.

This creates only a minimal `.human-ai/context/INDEX.md` router and `.human-ai/runs/` directory. It does not generate a wiki or scan the project.

## Optional: Gortex

```bash
curl -fsSL https://get.gortex.dev | sh
gortex install

cd /path/to/project
gortex init
```

Gortex is optional.

## Update

Re-run the bootstrap command. The installer replaces only the `human-ai` directory in the selected skill location.

## Uninstall

From a clone:

```bash
./scripts/uninstall.sh --agent codex --scope user
```

Or remove the installed `human-ai` skill directory manually.

Human + AI does not remove `.human-ai/` project context automatically because that directory may contain project-authored knowledge or retained run evidence.
