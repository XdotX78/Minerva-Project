# Memory

How Minerva's memory actually works, in depth. See the [README](../README.md)
for the short version.

## Two memory layers

**Structured memory** is the fast path: decisions, insights, preferences,
project facts, relations between entities, session continuity. This is what
lets Minerva — or any agent connected to it — resume work without rebuilding
context from scratch.

**Document memory** is the deeper path: long-form material — plans, notes,
documentation, references — kept searchable without flooding the active
memory path. RAG-style fallback when the task needs to go deeper.

Fast structured recall by default. Document retrieval only when the question
actually requires it.

## Beyond memory: agents, tasks, and coordination

Minerva also tracks:

- an agent roster: specialized agents you can talk to directly or that Minerva
  delegates to on your behalf
- intent registry: what an agent was trying to do, not just what it stored
- task coordination: structured task state that persists across sessions and clients
- workflow traces: a record of what happened, when, and in what sequence

Minerva can reconstruct the shape of previous work: what was in progress, what
was decided, what was abandoned and why — whether that work happened in a chat
with Minerva or in a coding session connected over MCP.

## Session review

Capturing a raw session is cheap. Turning it into **durable memory** is the job of the
session-review pass.

A summary records what happened. Session review goes one level up: it reads the
session and extracts the signals worth keeping for next time —

- **decisions** — what was decided and why
- **insights** — non-obvious things learned
- **behavioral signals** — how you prefer to work (corrections, confirmed approaches)
- **open threads** — what is still unfinished

These are written into Minerva as first-class memory, sourced back to the session,
so the next agent on any client starts from conclusions instead of re-reading a
transcript.

**When it runs.** On Claude Code the Stop hook marks a review as pending when a
session is substantial enough to be worth it; the review then runs as a background
sub-agent. On clients without a stop hook (e.g. Codex), Minerva marks the same
pending state and the review runs when you trigger it. Either way the goal is the
same: nothing durable from a working session is lost when the session closes.

## In practice

**Memory across sessions with Claude Code.** Start a coding session, work on a
project. Minerva records decisions, preferences, and facts as you go. Close
Claude Code. Open it again tomorrow. The model picks up context from where it
left off: what you decided, what the project state was, what changed. No
manual context-pasting.

**Switching clients mid-project.** You start in Claude Code, then move to
Cursor for a different part of the work. Both clients point at the same
Minerva server. Cursor sees the same memory that Claude Code built up. The
project context is not locked to the client.

**Structured search and document retrieval.** You ask the model to find a
decision you made two weeks ago about an API design. Minerva queries
structured memory first. If the answer is not there, it falls back to the
document layer — searching long-form material, plans, and reference docs you
have stored. The model gets a specific, sourced answer rather than reasoning
from scratch.
