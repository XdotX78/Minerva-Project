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

Every session starts cold.

You've explained the architecture three times this week. The agent doesn't know
why you made that call last Tuesday. It doesn't know what you tried and rejected.
Every switch, every reset, you pay for the same work again.

Memory shouldn't belong to the tool. It should belong to you.

Minerva is a local memory runtime. Facts, decisions, preferences, and session
history stored in a SQLite database on your machine — readable by any agent
you connect, outlasting any single tool, model, or harness.

Switch agents. Keep everything.

## Already running

- SQLite + vec0 on disk, no server, no cloud, no external dependency
- MCP over stdio — any client connects in minutes
- Hybrid search: full-text (BM25) + semantic (vec0) in one query
- Decision lineage: what was decided, why, which session it came from
- Cross-domain discovery: connections between facts you never explicitly linked
- Minerva, a local browser dashboard to inspect your memory
- 11 connectors: Claude Code, Cursor, Codex, OpenCode, Cline, Roo Code,
  VS Code, Windsurf, Zed, Gemini CLI, Continue
- Linux, macOS, Windows

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

Two layers.

Structured memory covers the fast-recall surface: facts, decisions, preferences,
relations, session continuity. Every decision includes the reasoning behind it
and which session it came from. The next agent picks up context, not just conclusions.

Document memory handles longer material — plans, notes, references, research —
indexed and searchable without taking up active context.

## Local-first

Your memory stays on your machine. No account, no hosted backend.

## Alpha

Early alpha, running today on Linux x86_64, macOS Apple Silicon, and Windows x86_64.

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
