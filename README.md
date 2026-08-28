# Minerva

<p align="center">
  <img src="assets/minervalogofinal.png" alt="Minerva" width="420"/>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/status-alpha-orange" alt="alpha"/>
  <img src="https://img.shields.io/badge/platform-linux%20%7C%20macos%20%7C%20windows-blue" alt="platform"/>
  <img src="https://img.shields.io/badge/data-local--first-2ea44f" alt="local-first"/>
  <img src="https://img.shields.io/badge/AI-local%20or%20cloud-6f42c1" alt="local or cloud AI"/>
</p>

<p align="center">
  <a href="#what-minerva-does">What it does</a> ·
  <a href="#at-work-in-everyday-life-and-at-home">Use cases</a> ·
  <a href="#screenshots">Screenshots</a> ·
  <a href="#install">Install</a> ·
  <a href="#learn-more">Docs</a>
</p>

---

<h2 align="center">Every time you switch apps, devices, or AI models, you start over. Minerva doesn't.</h2>

<p align="center">
Minerva remembers what matters, connects the apps, people, and devices around you, and coordinates a set of specialized AI agents to get things done, at work, at home, and in everyday life, without handing your data to anyone else.
</p>

Talk to Minerva by voice or text, directly or through the communication tools
you already use. Ask for a morning briefing, hand off research, organize a
project, check a schedule, find an earlier decision, or coordinate something
at home through Home Assistant.

Unlike a normal chatbot, Minerva does not begin every conversation from zero.
Its memory carries useful context across sessions, devices, AI models, and
specialized agents. You decide what it can access, which AI it uses, and which
actions remain under human approval.

Minerva itself does not require a cloud account. Its memory and orchestration
run on your machine. Use a local AI model, connect a cloud model with your own
key, or combine both.

[**Install Alpha**](#install) · [**See how it works ↓**](#screenshots)

---

## What Minerva does

### One memory that survives the conversation

Minerva keeps more than a chat log. It can hold onto decisions, preferences,
people, projects, and unfinished work, along with where each piece of
information came from. Come back tomorrow, switch devices, or switch AI
models, and you won't have to explain everything again.

### One place where your tools can work together

Gmail, Calendar, Drive, Home Assistant, Telegram, Discord, and any MCP server
you add stop acting like separate tools. Minerva gives its agents the context
and the approved connections they need to work across all of them.

### Specialized agents instead of one overloaded assistant

Different jobs need different skills. Minerva delegates research, writing,
scheduling, memory, and home tasks to specialized agents, and keeps the
results tied back to the same goals and memory.

### You control the data and the models

Everything runs locally, under your control. Pick a local model or an
external provider instead of being locked into one AI company. You can
inspect memory, review agent decisions, and require approval before anything
sensitive happens.

---

## At work, in everyday life, and at home

Minerva is being built for the places people actually need continuity, not
just inside a developer tool.

| At work | In everyday life | At home |
| --- | --- | --- |
| Prepare a briefing from calendars, messages, and documents | Remember plans, preferences, people, and open commitments | Connect Home Assistant and coordinate approved devices |
| Research a topic and keep the useful conclusions | Organize appointments, tasks, and personal projects | Ask what is happening at home in natural language |
| Turn a request into coordinated work for specialized agents | Continue the same conversation from another device or channel | Build routines that understand context instead of isolated commands |
| Preserve decisions and why they were made | Use voice, text, Telegram, or Discord | Keep household context local and under your control |

These all run on one system and one memory. Work context, personal context,
and home automation do not have to live in three separate apps.

---

## Screenshots

**Overview** — a voice-first home screen: today's calendar, agents currently
at work, and a mic to just talk to Minerva.

![Overview](assets/screenshots/overview.jpg)

**Agents** — the roster of specialized agents Minerva can delegate to, each
with its own role.

![Agents](assets/screenshots/agents.jpg)

**Integrations** — MCP servers and external tools connected to Minerva, with
per-server tool visibility.

![Integrations](assets/screenshots/tools.jpg)

**Devices & Channels** — pair a new device with a QR code (no terminal
required), and connect Telegram or Discord to talk to Minerva from there.

![Devices & Channels](assets/screenshots/devices-channels.jpg)

More in the [dashboard tour](docs/dashboard.md).

---

## Status

**Current release: 0.1.4-alpha, early testing.**

We're currently looking for a small group of early testers. If you want to
try Minerva, break things, and tell us what sucks, [start a
discussion](https://github.com/XdotX78/Minerva-Project/discussions) or [open an issue](https://github.com/XdotX78/Minerva-Project/issues).

What is working today:

- Minerva dashboard — chat with Minerva, manage agents, integrations, devices,
  and channels, inspect memory, all in a local browser UI
- Assistant chat — text and voice, plus Telegram and Discord as messaging
  channels (WhatsApp and email are on the roadmap)
- Agents — a roster of specialized agents (research, writing, home automation,
  scheduling, memory) that can be delegated to from chat
- Integrations — Google (Gmail, Calendar, Drive, Tasks, YouTube), Home
  Assistant, and any MCP server you add
- MCP server — running and accepting connections from supported coding clients
- CLI (`foundation` binary) — installs and runs on Linux, macOS, and Windows
- Remote access — reachable from another machine over a private network or VPN

The core is functional. Packaging and naming are still being cleaned up.
[Open an issue](https://github.com/XdotX78/Minerva-Project/issues) if something breaks.

---

## Supported clients

For technical users, Minerva also works with Claude Code, Cursor, Codex,
OpenClaw, and other MCP-compatible clients. Claude Code and OpenClaw also get
automatic memory through native lifecycle hooks.

[See all supported clients →](docs/clients.md)

---

## Naming: Minerva and Foundation

The public project name is Minerva.

The CLI command is still `foundation`, a holdover while naming and packaging
get cleaned up. When you install and run the system, you'll be typing
`foundation` at the terminal. That's the correct binary, not a typo in these
docs.

---

## Requirements

Supported platforms:

- Linux x86_64
- macOS Apple Silicon
- Windows x86_64

Linux aarch64 and broader coverage are planned in later releases.

The binary bundle is self-contained — no Docker, no separate runtime to
install. Chat and agents need an LLM: point Minerva at a local model (e.g.
Ollama) or a cloud provider's API key, your choice.

---

## Install

Pick your system, open the app it names, paste the one line, press Enter.

### macOS (Apple Silicon)

Open **Terminal** — press `Cmd + Space`, type `Terminal`, press Enter — then
paste this and press Enter:

```bash
curl -fsSL https://raw.githubusercontent.com/XdotX78/Minerva-Project/main/install.sh | bash
```

Intel Macs aren't supported yet; check the [releases page](https://github.com/XdotX78/Minerva-Project/releases) for updates.

### Linux (x86_64)

Open your terminal, paste this, press Enter:

```bash
curl -fsSL https://raw.githubusercontent.com/XdotX78/Minerva-Project/main/install.sh | bash
```

### Windows

Open **PowerShell** — right-click the Start button, choose "Windows
PowerShell" or "Terminal" — then paste this and press Enter:

```powershell
irm https://raw.githubusercontent.com/XdotX78/Minerva-Project/main/install.ps1 | iex
```

### What happens next

All three installers do the same thing: download Minerva, verify it, then
start it and open the dashboard in your browser automatically. You won't need
to run a second command, look up an address, or hunt for an app icon.

Manual install:

1. Download the right archive from the [latest release](https://github.com/XdotX78/Minerva-Project/releases/latest).
2. Extract it.
3. Move the `foundation` binary and bundled sidecars somewhere stable.
4. Follow the [release notes](https://github.com/XdotX78/Minerva-Project/releases/latest) for client setup.

The rollout is staged. Check the [release notes](https://github.com/XdotX78/Minerva-Project/releases/latest)
to confirm which platform assets are published before relying on the installer.

---

## Verify downloads

Each public release includes:

- platform archives
- `SHA256SUMS`
- short [release notes](https://github.com/XdotX78/Minerva-Project/releases/latest)

```bash
sha256sum -c SHA256SUMS
```

---

## Connect a client

The quickest path is the built-in connector:

```bash
foundation connect <tool>
```

```bash
foundation connect cursor
foundation doctor cursor
```

Full connector ID list and per-client notes: [docs/clients.md](docs/clients.md).

---

## Upgrade

If you already have Minerva installed, use the built-in update command:

```bash
foundation update
foundation restart
```

This downloads the [latest release](https://github.com/XdotX78/Minerva-Project/releases/latest),
replaces the binary, and leaves your database and configuration untouched.

To pin a specific version:

```bash
foundation update --version 0.1.4-alpha
```

To roll back, download a [previous release](https://github.com/XdotX78/Minerva-Project/releases) archive and extract it in place.

For a fresh machine or a broken install, re-run the full installer:

```bash
curl -fsSL https://raw.githubusercontent.com/XdotX78/Minerva-Project/main/install.sh | bash
```

---

## Uninstall

Remove the `foundation` binary and bundled sidecar components. The data
directory is separate; removing it is optional, and doing so will delete your
stored memory.

Check the [release notes](https://github.com/XdotX78/Minerva-Project/releases/latest) for the exact paths for your platform.

---

## Backup

Your memory database is a regular file on disk. Back it up by copying the data
directory. No special export step is needed.

The database survives upgrades. Your memory is not reset when you update the binary.

---

## Learn more

The sections above are everything you need to try Minerva. For how it works
under the hood:

- [Memory](docs/memory.md) — structured vs. document memory, agents, tasks, session review
- [Dashboard](docs/dashboard.md) — full tour of what the local UI shows and does
- [Architecture](docs/architecture.md) — why it's fast, local-first networking
- [Claude Code integration](docs/claude-code.md) — automatic memory via lifecycle hooks
- [OpenClaw integration](docs/openclaw.md) — automatic memory via lifecycle hooks
- [Supported clients](docs/clients.md) — full connector list and setup

---

## What you get here

This is the public distribution repository for Minerva.

It contains public releases, install instructions, checksums, compatibility
notes, and issue tracking for install and release problems. It does not contain
the application source code.

---

## Support

Use this repository for:

- install failures
- broken release assets
- compatibility reports
- documentation fixes

---

## License

Minerva binaries and documentation are distributed under the terms published in
the release and repository metadata. The source code remains private.
