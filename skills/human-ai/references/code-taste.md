# Code taste and deep modules

Use this reference to ensure agent-authored code remains elegant, maintainable, and structurally sound.

LLMs optimize for local next-token likelihood. Without structural constraints, they produce "AI slop": copy-pasted boilerplate, shallow wrapper functions, defensive null-checking, and sprawling `if/else` ladders.

---

## 1. The Contract Gate (Interfaces before implementation)

For any task beyond a trivial local fix (L1 Ship, L2 Planned, L3 Guarded):

1. **Write the contract skeleton first:**
   - Define types, interfaces, schemas, Pydantic models, or function signatures.
   - Leave implementation bodies as stubs (`pass` or throw `NotImplementedError`).
2. **Review the contract surface:**
   - Is the public surface minimal?
   - Can callers achieve their goal without knowing implementation mechanics?
   - Are data types immutable and strictly validated at ingress boundaries?
3. **Implement against the frozen contract:**
   - Only after signatures are fixed, write internal execution logic.
   - Do not let implementation convenience leak ad-hoc parameters into public interfaces.

---

## 2. Deep Modules vs Shallow Wrappers

A **deep module** provides powerful functionality through a small, simple interface.  
A **shallow module** has a complex or verbose interface for relatively little functionality, or acts as a pass-through layer.

### Rule of thumb
- **Prefer deep modules:** A single coherent class or module with 2–3 public methods that encapsulates 200 lines of complex file parsing or graph traversal.
- **Reject shallow wrappers:** Do not create a helper function or wrapper class whose only job is calling another function with identical arguments:
  ```typescript
  // BAD: Shallow wrapper adding zero value
  function fetchUserById(id: string) {
    return userRepository.getById(id);
  }
  ```
- **Combine small related operations:** If three functions are always called together in sequence, combine them into one meaningful domain action.

---

## 3. The Simplify & Deepen Pass

When all tests and verifications are green, the code is functional but unrefined. Before closing the task:

1. **Aim for a 20–30% line reduction:**
   - Look for copy-pasted validation blocks; extract a single validator or schema.
   - Replace manual dictionary manipulation with typed dataclasses or pattern matching.
2. **Eliminate defensive slop:**
   - Do not write `try/catch (Exception e) {}` that swallows errors.
   - Do not add `if (x !== null && x !== undefined)` checks if the static type system already guarantees non-nullability.
3. **Verify invariants:**
   - Re-run test suites and type checkers.
   - Refactoring must not break external behavior or observable contracts.

---

## 4. Deterministic Quality Gates

Do not waste human attention or debate code style with agents. Follow [Dev Quality Gates](https://github.com/mokevnin/dev-quality-gates):
- **Fast native binaries:** Use single Rust-native binaries (Ruff, Oxlint, jactionlint, rumdl) that provide sub-second verification.
- **Fail the build:** Enforce zero-tolerance exit codes on standard violations; unread advisory reports do not count.
- **Agent self-correction:** Machine-readable diagnostics and automated fixes (`--fix`) allow agents to resolve syntax, style, and hygiene issues before asking for human review.
