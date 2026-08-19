# Claude Code integration

Automatic, hands-off memory for Claude Code. See the [README](../README.md)
for how this compares to other clients.

Most MCP clients load memory **on demand** — the agent calls a tool when it
needs context. Claude Code goes further and makes the whole loop hands-off
through native lifecycle hooks. You never have to remember to load or save
anything.

```
session starts  → memory snapshot injected automatically
you work        → facts and decisions captured as you go
session ends    → session summarized and saved automatically
```

`foundation connect claude-code` plus the bundled hooks wire three events:

- **SessionStart** — injects a memory snapshot (active project, recent decisions,
  open threads) before your first message.
- **PostToolUse (Write / Edit)** — captures work in real time as files change.
- **Stop** — summarizes the session and extracts durable facts when the session ends.

See [memory.md](memory.md) for how session review turns a captured session
into durable, structured memory.
