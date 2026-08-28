# Minerva

<p align="center">
  <img src="assets/minervalogofinal.png" alt="Minerva" width="420"/>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/status-alpha-orange" alt="alpha"/>
  <img src="https://img.shields.io/badge/platform-linux%20%7C%20macos%20%7C%20windows-blue" alt="platform"/>
  <img src="https://img.shields.io/badge/license-source--available-lightgrey" alt="source-available"/>
</p>

<p align="center">
  <a href="#for-your-life-for-your-work">For you</a> ·
  <a href="#examples">Examples</a> ·
  <a href="#screenshots">Screenshots</a> ·
  <a href="#download-and-install">Download</a> ·
  <a href="#learn-more">Docs</a>
</p>

---

**One private AI for your life and work — with a memory that stays yours.**

Minerva remembers what matters, works with your calendar, email, documents,
and home, and can hand off longer jobs to specialized agents. It runs on
your own computer, and you choose which AI models and services it uses.

[**Get Minerva for Windows**](https://github.com/XdotX78/Minerva-Project/releases/tag/v0.1.5-alpha) · [**See how it works ↓**](#screenshots)

---

## For your life, for your work

**For your life**

- Remembers people, plans, and things you've told it before
- Keeps track of your calendar and commitments
- Connects to Home Assistant so it can help around the house
- Keeps the same memory even if you switch to a different AI model

**For your work**

- Reads and helps with email, documents, and the tools you already use
- Prepares briefings, does research, and follows up on open items
- Hands off longer tasks to specialized agents while you do something else
- Shares one memory with compatible AI and coding tools, instead of
  starting over in each one

---

## Examples

- **Calendar and briefings** — ask what's on your calendar, and Minerva
  checks it, pulls the relevant context from memory, and drafts a quick
  briefing.
- **Remembering things** — tell Minerva something once, like a decision or
  a plan, and it can bring it back up later without you repeating yourself.
- **Research in the background** — hand a research topic to an agent. It
  works in the background while you do something else, and reports back
  when it's done.
- **Around the house** — connect Home Assistant, and ask Minerva what's
  happening at home in plain language.
- **One memory, several tools** — the memory Minerva builds in chat is also
  available to compatible AI and coding tools, like Claude Code, Cursor,
  and Codex, so you don't have to explain the same context twice.

---

## Screenshots

**Overview** — a voice-first home screen: today's calendar, agents currently
at work, and a mic to just talk to Minerva.

![Overview](assets/screenshots/overview.jpg)

**Agents** — the roster of specialized agents Minerva can delegate to, each
with its own role.

![Agents](assets/screenshots/agents.jpg)

**Integrations** — the outside tools and services Minerva connects to,
including support for MCP (a shared standard that lets AI tools connect to
the same apps and data), with visibility into what each one can access.

![Integrations](assets/screenshots/tools.jpg)

**Devices & Channels** — pair a new device with a QR code (no terminal
required), and connect Telegram or Discord to talk to Minerva from there.

![Devices & Channels](assets/screenshots/devices-channels.jpg)

More in the [dashboard tour](docs/dashboard.md).

---

## Why Minerva is different

**Agents that work in the background.** A roster of specialized agents —
research, writing, scheduling, home automation — Minerva can talk to
directly or delegate to on your behalf.

**Connected to your world.** Gmail, Calendar, Drive, Home Assistant,
Telegram, Discord, and any other tool you connect. Minerva reads across
them instead of treating each one as its own silo.

**One shared memory.** Chat with Minerva directly, or connect compatible AI
tools, including coding assistants like Claude Code, Cursor, and Codex,
over MCP. Personal assistants and coding tools usually keep separate
memories. Minerva gives them one memory you control.

---

## Privacy and control

Your memory, database, and agent runtime stay on your machine. External
services, like Gmail, Home Assistant, or a cloud AI model, are contacted
only when you choose to connect them.

Back up your data by copying the local folder. There's no separate export
step, and no account required to use Minerva.

---

## Status

**Current channel: alpha — early testing.**

We're currently looking for a small group of early testers. If you want to
try Minerva and tell us what breaks, feels confusing, or should work
better, [start a discussion](https://github.com/XdotX78/Minerva-Project/discussions)
or [open an issue](https://github.com/XdotX78/Minerva-Project/issues).

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

## Download and install

Supported platforms:

- Windows x86_64
- macOS Apple Silicon
- Linux x86_64

Linux aarch64 and broader macOS/Linux coverage are planned for later releases.

The binary bundle is self-contained — no Docker, no separate runtime to
install. Chat and agents need an LLM: point Minerva at a local model (e.g.
Ollama) or a cloud provider's API key, your choice.

The current v0.1.5-alpha prerelease is Windows-only. macOS and Linux install
from the most recent supported release using the script below; which assets
are published can vary from release to release.

### Windows

[**Download Minerva for Windows**](https://github.com/XdotX78/Minerva-Project/releases/tag/v0.1.5-alpha)

1. Open the release page.
2. Download `Minerva-Setup-Windows-x64-0.1.5-alpha.exe`.
3. Run the installer.
4. Open **Minerva** from the Start menu.

No terminal, Rust, Node, Git, WebView2, or administrator access is required.
Alpha installers may be unsigned; when they are, Windows SmartScreen can show
a warning. Check the release notes before continuing.

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

### What happens next

On Windows, the installer creates the Start menu entry and starts Minerva.
The dashboard opens in your browser. On macOS and Linux, the install script
performs the equivalent setup.

Manual install:

1. Download the right archive from the [latest release](https://github.com/XdotX78/Minerva-Project/releases/latest).
2. Extract it.
3. Move the `foundation` binary and bundled sidecars somewhere stable.
4. Follow the [release notes](https://github.com/XdotX78/Minerva-Project/releases/latest) for client setup.

The rollout is staged. Check the [release notes](https://github.com/XdotX78/Minerva-Project/releases/latest)
to confirm which platform assets are published before relying on the installer.

### Verify downloads

The current Windows prerelease includes:

- `Minerva-Setup-Windows-x64-0.1.5-alpha.exe`
- `SHA256SUMS`
- `build-manifest.json`
- short [release notes](https://github.com/XdotX78/Minerva-Project/releases/tag/v0.1.5-alpha)

```bash
sha256sum -c SHA256SUMS
```

---

## Supported clients and shared memory

<p align="center">
  <img src="https://img.shields.io/badge/protocol-MCP-6f42c1" alt="MCP"/>
  <img src="https://img.shields.io/badge/built%20with-Rust-orange?logo=rust&logoColor=white" alt="Rust"/>
</p>

Minerva can also share its memory with compatible AI tools through MCP
(Model Context Protocol), an open standard for connecting AI tools to
shared data and memory. It works with Claude Code, Cursor, Codex, OpenClaw,
and any other MCP-compatible client. Claude Code and OpenClaw also get
automatic, hands-off memory through native lifecycle hooks.

[See all supported clients →](docs/clients.md)

The quickest way to connect a client is the built-in connector:

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

On Windows, download and run the newer installer. It replaces application files
without deleting the separate data, configuration, vault, or logs.

Advanced CLI users can also use:

```bash
foundation update
foundation restart
```

This downloads the [latest release](https://github.com/XdotX78/Minerva-Project/releases/latest),
replaces the binary, and leaves your database and configuration untouched.

To pin a specific version:

```bash
foundation update --version 0.1.5-alpha
```

To roll back, download a [previous release](https://github.com/XdotX78/Minerva-Project/releases) archive and extract it in place.

For a fresh macOS or Linux machine, re-run the install script:

```bash
curl -fsSL https://raw.githubusercontent.com/XdotX78/Minerva-Project/main/install.sh | bash
```

---

## Uninstall

On Windows, uninstall **Minerva** from Installed apps. Application files and the
Start menu shortcut are removed; the separate data, configuration, vault, and
logs are preserved.

On macOS and Linux, remove the `foundation` binary and bundled sidecars. The
data directory remains separate.

Check the [release notes](https://github.com/XdotX78/Minerva-Project/releases/latest) for the exact paths for your platform.

---

## Backup

Your memory database is a regular file on disk. Back it up by copying the data
directory. No special export step is needed.

The database survives upgrades. Your memory is not reset when you update the binary.

---

## Naming: Minerva and Foundation

The public project name is Minerva.

The internal CLI command is still `foundation`. Windows users do not need to
use it: the installer and Start menu entry are named Minerva.

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
