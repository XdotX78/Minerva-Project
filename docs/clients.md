# Supported clients

Beyond its own chat, Minerva exposes a standard MCP server for coding tools.
Any client that speaks MCP can connect and share the same memory.

Clients with confirmed connectors:

| Client | Status |
|---|---|
| Claude Code | Supported (automatic memory) |
| Claude Desktop | Supported |
| Cursor | Supported |
| Codex | Supported |
| OpenCode | Supported |
| OpenClaw | Supported (automatic memory) |
| Cline | Supported |
| Roo Code | Supported |
| VS Code | Supported |
| Windsurf | Supported |
| Zed | Supported |
| Gemini CLI | Supported |
| Continue | Supported |
| Copilot | Supported |
| Hermes | Supported |
| Pi | Supported |
| Amazon Q | Supported |
| JetBrains (Junie) | Supported |
| Goose | Supported |

If your tool supports MCP server configuration, it should work.

Claude Code and OpenClaw get automatic, hands-off memory through native
lifecycle hooks — see [claude-code.md](claude-code.md) and
[openclaw.md](openclaw.md). Every other client still reads and writes the
same memory through MCP, just on demand instead of automatically.

## Connecting

The quickest path is the built-in connector:

```bash
foundation connect <tool>
```

Supported connector IDs: `claude-code` · `claude-desktop` · `cursor` · `codex` ·
`opencode` · `openclaw` · `cline` · `roo-code` · `vscode` · `windsurf` · `zed` ·
`gemini-cli` · `continue` · `copilot` · `hermes` · `pi` · `amazon-q` ·
`jetbrains` · `goose`

Example:

```bash
foundation connect cursor
foundation doctor cursor
```

Check the release notes for the config format if you need to set up a client
manually.
