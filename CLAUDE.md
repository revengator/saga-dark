# CLAUDE.md — Instructions for Claude in this project

> This file is **only** for Claude. The project's live state and the conventions every contributor must follow live in
> [`CONTEXT.md`](CONTEXT.md), which is model-agnostic. Read it first — the rules in `CONTEXT.md §"Project conventions"`
> bind Claude as well.

## Before doing anything, read:

1. [`CONTEXT.md`](CONTEXT.md) — authoritative state, project conventions, "RESUME HERE" section.
2. [`README.md`](README.md) — quick repo overview.
3. [`docs/engine-architecture.md`](docs/engine-architecture.md) if you're going to touch the engine/enemies.

## Workflow rules

- **Update `CONTEXT.md` after every completed step.** It is the only context that persists across sessions. Mark
  completed steps with ✅ and move "RESUME HERE" to the next action. This applies to housekeeping work too — repo
  reorganisation, license, renames, layout conventions all count as completed steps.
- **Emulator testing — the user verifies visually.** Don't try automated screenshots or read the framebuffer. Launch
  Fuse/ZEsarUX and wait for the user to confirm.
- **Keep `CONTEXT.md` lean.** It is loaded into context every conversation, so every line costs tokens forever. Run
  `wc -l CONTEXT.md` before adding new sections.
    - **≤ 350 lines:** add freely.
    - **350–450 lines (soft threshold):** before adding, consider compacting first.
    - **≥ 450 lines (hard threshold):** compact in the same turn, do not let it grow further.
  When compacting, preserve in full: `RESUME HERE`, `Project conventions`, `Current state`, `Engine reference`,
  `Repository structure`, `Phase plan`, `Open questions`. Trim aggressively: collapse old "Recent housekeeping"
  sessions into one-liners (or drop entirely once their detail is reflected elsewhere — `git log` is authoritative
  for what changed and when), and remove any duplication with sibling READMEs (link to them instead). Aim to land
  back under 300 lines after compaction.

## Communication

- **Chat with the user: in Spanish.** Replies, explanations, questions — all in Spanish.
- **Documentation written to the repo: in English.** Enforced as a project convention (see
  `CONTEXT.md §"Project conventions"`). Spanish only stays in chat with the user and in in-game text quotes.

## Things NOT to do

- Do not rename `CONTEXT.md` to `CLAUDE.md` or merge them. The split exists so the live context is readable by other
  agents and human contributors without requiring Claude-specific instructions.
