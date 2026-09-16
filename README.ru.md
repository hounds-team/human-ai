# Human + AI

**Инженерный фреймворк для совместной работы человека и coding-агентов, где глубина процесса зависит от риска задачи.**

[English](README.md) · [简体中文](README.zh-CN.md)

Human + AI нужен не для того, чтобы агент писал больше кода. Он нужен, чтобы агент быстрее доводил задачу до работающего результата и при этом не раздувал scope, архитектуру и процесс.

Фреймворк задаёт несколько простых правил:

- сначала сделать узкий, но настоящий пользовательский результат;
- усиливать планирование и ревью только там, где есть неопределённость или риск;
- не читать весь репозиторий, если нужный код можно локализовать точечно;
- не спрашивать человека о том, что агент может надёжно выяснить из кода;
- не мокать ключевую ценность продукта;
- оставлять проверяемые evidence, но не сохранять скрытые рассуждения модели;
- переносить в постоянный контекст только знания, которые пригодятся в следующих задачах;
- новые правила добавлять после повторяющихся провалов, а не «на всякий случай».

Один и тот же skill можно использовать в Codex, Claude Code, Pi, Gemini CLI и OpenCode.

## Как устроен процесс

```text
намерение
  -> оценка задачи
  -> нужный контекст
  -> краткий Task Brief
  -> реализация
  -> проверка
  -> независимый проход, если он оправдан риском
  -> закрытие задачи
  -> долговечный контекст
  -> evals
```

Не каждая задача проходит все этапы.

## Уровни задач

| Уровень | Когда | По умолчанию |
|---|---|---|
| L0 Quick | очевидная локальная правка | изменение + точечная проверка |
| L1 Ship | MVP, демо, небольшая фича | короткий outcome + vertical slice + smoke/targeted check |
| L2 Planned | неоднозначная или сквозная фича | Task Brief + проверка + независимое ревью |
| L3 Guarded | auth, tenants, платежи, destructive actions, чувствительные данные, рискованные миграции | явные риски + усиленная проверка + независимое ревью |

Риск не обязан автоматически превращать задачу в длинный PRD. Например, маленькая правка в авторизации может требовать сильной проверки, но не большой спецификации.

## Режимы L1

```text
mode: demo | mvp | patch
validation: smoke | targeted | full
tests: none | targeted | required
```

- `demo` — убедительный основной сценарий; на второстепенных границах допустимы явно обозначенные моки.
- `mvp` — первая реально используемая версия end-to-end; режим по умолчанию.
- `patch` — минимальная правка в существующем продукте без перестройки соседних систем.

## Экономия контекста

Предпочтительный путь:

```text
локализовать код
-> посмотреть связи и blast radius
-> прочитать точную реализацию
-> изменить
-> проверить затронутую область
```

[Gortex](https://gortex.dev/) можно использовать как опциональный context engine. Без него Human + AI тоже работает.

## Долговечный контекст

Если проекту нужен контекст между сессиями, можно завести лёгкий router:

```text
.human-ai/context/INDEX.md
```

Создать минимальный каркас:

```bash
skills/human-ai/scripts/init-context.sh
```

В него не нужно переносить содержимое репозитория. Он только указывает, где лежат действительно долгоживущие правила и факты проекта.

## Установка

### Codex

```bash
curl -fsSL https://raw.githubusercontent.com/hounds-team/human-ai/main/scripts/bootstrap.sh | bash -s -- --agent codex --scope user
```

```text
$human-ai Ship the first usable slice. mode: mvp.
```

### Claude Code

```bash
curl -fsSL https://raw.githubusercontent.com/hounds-team/human-ai/main/scripts/bootstrap.sh | bash -s -- --agent claude --scope user
```

```text
/human-ai Ship the first usable slice. mode: mvp.
```

### Pi

```bash
curl -fsSL https://raw.githubusercontent.com/hounds-team/human-ai/main/scripts/bootstrap.sh | bash -s -- --agent pi --scope user
```

```text
/skill:human-ai
```

Или напрямую:

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

### Все поддерживаемые агенты

```bash
curl -fsSL https://raw.githubusercontent.com/hounds-team/human-ai/main/scripts/bootstrap.sh | bash -s -- --agent all --scope user
```

Для установки только в текущий проект замените `--scope user` на `--scope project`.

Подробности: [docs/INSTALL.md](docs/INSTALL.md).

## Заимствования и оригинальность

Мы изучаем публичные проекты и статьи, но не используем их как шаблон. В Human + AI не должны дословно переноситься чужие промпты, названия ролей, структура каталогов или последовательность workflow.

В [INSPIRATIONS.md](INSPIRATIONS.md) зафиксировано, какие идеи повлияли на фреймворк и как мы их переработали. Если в будущем в репозиторий попадёт реальный сторонний код или существенный фрагмент текста, рядом должна быть его лицензия и атрибуция.

## Статус

**v0.4 — ранняя и намеренно небольшая версия.**

Новые слои появляются только после реальной проблемы, которую можно воспроизвести и проверить eval'ом.
