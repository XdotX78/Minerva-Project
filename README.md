# Minerva

<p align="center">
  <img src="assets/minervalogofinal.png" alt="Minerva" width="420"/>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/status-alpha-orange" alt="alpha"/>
  <img src="https://img.shields.io/badge/platform-linux%20%7C%20macos%20%7C%20windows-blue" alt="platform"/>
  <img src="https://img.shields.io/badge/protocol-MCP-6f42c1" alt="MCP"/>
  <img src="https://img.shields.io/badge/built%20with-Rust-orange?logo=rust&logoColor=white" alt="Rust"/>
  <img src="https://img.shields.io/badge/license-source--available-lightgrey" alt="source-available"/>
</p>

---

**Persistent local memory for AI agents.**

Every time you switch tools, your context dies.

Decisions disappear. Architecture reasoning disappears. The agent starts cold
and you spend the first part of the session rebuilding what you already knew.

Your memory shouldn't belong to whatever tool you happen to be using today.

Minerva keeps a local memory layer outside any single harness, model, or
editor. Facts, decisions, preferences, session history — stored on your machine,
accessible to any agent you connect. Switch tools and it's still there.

## Already running

- Local SQLite database, no server, no cloud, no external dependency
- MCP over stdio, connects any client in minutes
- Hybrid search: full-text (BM25) + semantic (vec0) in a single query
- Decision lineage: stores what was decided, why, and which session it came from
- Cross-domain discovery: surfaces connections between facts you never explicitly linked
- Minerva, a local browser dashboard to inspect your memory
- Works with Claude Code, Cursor, Codex, OpenCode, Cline, Roo Code, VS Code,
  Windsurf, Zed, Gemini CLI, and more
- Linux, macOS, and Windows

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/XdotX78/Minerva-Project/main/install.sh | bash
```

Windows:

```powershell
irm https://raw.githubusercontent.com/XdotX78/Minerva-Project/main/install.ps1 | iex
```

Then connect your first client:

```bash
foundation connect <tool>
```

Supported: `claude-code` · `cursor` · `codex` · `opencode` · `cline` ·
`roo-code` · `vscode` · `windsurf` · `zed` · `gemini-cli` · `continue`

## What Minerva keeps

There are two memory layers.

Structured memory is the fast path: facts, decisions, preferences, relations,
and session continuity. An agent that connects picks up where the last session
left off, without rebuilding context. Every decision includes the reasoning
behind it and the session it came from. The next agent inherits context, not
just conclusions.

Document memory handles longer material. Plans, notes, references, research.
It stays searchable without flooding active recall. RAG fallback when the task
actually needs to go deeper.

## Local-first

Your memory stays on your machine. No account, no hosted backend.

## Alpha

Early alpha, running today on Linux x86_64, macOS Apple Silicon, and Windows
x86_64.

The public project name is Minerva. The CLI command is still `foundation`
while naming cleanup is in progress.

Verify before installing:

```bash
sha256sum -c SHA256SUMS
```

## Support

Use this repository for install failures, broken release assets, compatibility
reports, and documentation fixes. Source code is private.

## License

Minerva binaries and documentation are distributed under the terms in the
repository. Source code remains private.
