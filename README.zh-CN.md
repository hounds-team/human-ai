# Human + AI

**一个面向人类与编程代理协作的风险分级工程框架。**

[English](README.md) · [Русский](README.ru.md)

Human + AI 的目标不是让代理生成更多代码，而是让它以更少的无效探索、更清晰的边界和可验证的结果完成真实任务。

核心原则：

- 先交付最小但真实的用户结果；
- 规划、测试和审查的深度随不确定性和风险增加；
- 优先定位相关代码，而不是扫描整个仓库；
- 不要向人询问可以从代码中可靠获得的事实；
- 产品的核心差异化能力必须真实工作；
- 保留可检查的工程证据，但不保存模型的私有思维链；
- 只保留未来任务仍然有价值的长期项目上下文；
- 只有在真实失败可以被 eval 重现时，才增加新的流程规则。

同一个 `human-ai` skill 可用于 Codex、Claude Code、Pi、Gemini CLI 和 OpenCode。

## 工作循环

```text
intent
  -> triage
  -> context
  -> task brief
  -> build
  -> verify
  -> independent pass when justified
  -> closeout
  -> durable context
  -> evals
```

并非每个任务都需要全部步骤。

## 任务等级

| 等级 | 典型任务 | 默认流程 |
|---|---|---|
| L0 Quick | 明确的局部修改 | 直接修改 + 定向检查 |
| L1 Ship | MVP、demo、小功能 | 简短 outcome + 垂直交付 + smoke/targeted 验证 |
| L2 Planned | 有明显歧义或跨模块影响 | Task Brief + 定向验证 + 独立审查 |
| L3 Guarded | 授权、多租户、支付、破坏性操作、敏感数据、高风险迁移 | 明确风险 + 风险驱动验证 + 独立审查 |

## L1 模式

```text
mode: demo | mvp | patch
validation: smoke | targeted | full
tests: none | targeted | required
```

## 上下文经济

优先：

```text
定位
-> 查看关系和影响范围
-> 阅读精确源码
-> 修改
-> 诊断改动区域
```

[Gortex](https://gortex.dev/) 是推荐但非必需的 context engine。

## 安装

### Codex

```bash
curl -fsSL https://raw.githubusercontent.com/hounds-team/human-ai/main/scripts/bootstrap.sh | bash -s -- --agent codex --scope user
```

### Claude Code

```bash
curl -fsSL https://raw.githubusercontent.com/hounds-team/human-ai/main/scripts/bootstrap.sh | bash -s -- --agent claude --scope user
```

### Pi

```bash
curl -fsSL https://raw.githubusercontent.com/hounds-team/human-ai/main/scripts/bootstrap.sh | bash -s -- --agent pi --scope user
```

或：

```bash
pi install git:github.com/hounds-team/human-ai
```

### Gemini CLI

```bash
curl -fsSL https://raw.githubusercontent.com/hounds-team/human-ai/main/scripts/bootstrap.sh | bash -s -- --agent gemini --scope user
```

### OpenCode

```bash
curl -fsSL https://raw.githubusercontent.com/hounds-team/human-ai/main/scripts/bootstrap.sh | bash -s -- --agent opencode --scope user
```

### 全部支持的代理

```bash
curl -fsSL https://raw.githubusercontent.com/hounds-team/human-ai/main/scripts/bootstrap.sh | bash -s -- --agent all --scope user
```

项目级安装请将 `--scope user` 改为 `--scope project`。

更多说明见 [docs/INSTALL.md](docs/INSTALL.md)。

## 原创性与引用

Human + AI 会研究公开的代理工程项目，但不会把它们当作模板。外部项目的文字、代理角色名称、目录结构和 workflow taxonomy 不应被直接复制。

[INSPIRATIONS.md](INSPIRATIONS.md) 记录了哪些公开思想影响了本框架，以及这些思想如何被重新设计为 Human + AI 自己的机制。

## 状态

**v0.4 — 早期版本，并且有意保持轻量。**
