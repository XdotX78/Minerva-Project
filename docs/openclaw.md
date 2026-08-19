# OpenClaw integration

Automatic, hands-off memory for OpenClaw. See the [README](../README.md) for
how this compares to other clients.

Most MCP clients load memory **on demand** — the agent calls a tool when it
needs context. [OpenClaw](https://github.com/openclaw/openclaw) goes further
and makes the whole loop hands-off through its own lifecycle events.

```
session starts  → memory snapshot injected automatically
you work        → facts and decisions captured as you go
session ends    → session summarized and saved automatically
```

`foundation connect openclaw`:

1. Registers the Minerva MCP server in `~/.openclaw/openclaw.json`.
2. Installs two hooks in `~/.openclaw/hooks/`:
   - **foundation-bootstrap** (`gateway:startup`, `agent:bootstrap`) — loads the
     snapshot and injects it into the agent at startup.
   - **foundation-session** (`gateway:shutdown`, `/new`, `/reset`) — saves the
     session back into memory in the background.

Enable the hooks once and restart the gateway:

```bash
foundation connect openclaw
openclaw hooks enable foundation-bootstrap foundation-session
```

See [memory.md](memory.md) for how session review turns a captured session
into durable, structured memory.
