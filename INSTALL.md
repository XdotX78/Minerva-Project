# Install Corax

Everything you need to install, update, back up and remove Corax.
For what Corax is and what it does, see the [README](README.md).

<p align="center">
  <img src="https://img.shields.io/badge/status-alpha-orange" alt="alpha"/>
  <img src="https://img.shields.io/badge/platform-linux%20%7C%20macos%20%7C%20windows-blue" alt="platform"/>
</p>

---

## Before you start

Supported platforms:

- Windows x86_64
- macOS Apple Silicon
- Linux x86_64

Linux aarch64 and broader macOS/Linux coverage are planned for later releases.

The bundle is self-contained: no Docker, no separate runtime to install.
Chat and agents need an AI model. Point Corax at a local model (for example
Ollama or LM Studio) or at a cloud provider's API key. Your choice, and you
can change it later.

The current v0.1.5-alpha prerelease is Windows-only. macOS and Linux install
from the most recent supported release using the script below; which assets
are published can vary from release to release.

> **About the name.** The product is now called Corax. In the current alpha
> the Windows installer and Start menu entry are still named **Minerva**, and
> the command-line tool is called `foundation`. Same product.

---

## Windows

[**Download for Windows**](https://github.com/XdotX78/Minerva-Project/releases/tag/v0.1.5-alpha)

1. Open the release page.
2. Download `Minerva-Setup-Windows-x64-0.1.5-alpha.exe`.
3. Run the installer.
4. Open **Minerva** from the Start menu.

No terminal, Rust, Node, Git, WebView2, or administrator access is required.
Alpha installers may be unsigned; when they are, Windows SmartScreen can show
a warning. Check the release notes before continuing.

## macOS (Apple Silicon)

Open **Terminal** (press `Cmd + Space`, type `Terminal`, press Enter), then
paste this and press Enter:

```bash
curl -fsSL https://raw.githubusercontent.com/XdotX78/Minerva-Project/main/install.sh | bash
```

Intel Macs aren't supported yet; check the [releases page](https://github.com/XdotX78/Minerva-Project/releases) for updates.

## Linux (x86_64)

Open your terminal, paste this, press Enter:

```bash
curl -fsSL https://raw.githubusercontent.com/XdotX78/Minerva-Project/main/install.sh | bash
```

## What happens next

On Windows, the installer creates the Start menu entry and starts Corax.
The dashboard opens in your browser. On macOS and Linux, the install script
performs the equivalent setup.

Manual install:

1. Download the right archive from the [latest release](https://github.com/XdotX78/Minerva-Project/releases/latest).
2. Extract it.
3. Move the `foundation` binary and bundled sidecars somewhere stable.
4. Follow the [release notes](https://github.com/XdotX78/Minerva-Project/releases/latest) for client setup.

The rollout is staged. Check the [release notes](https://github.com/XdotX78/Minerva-Project/releases/latest)
to confirm which platform assets are published before relying on the installer.

---

## Verify downloads

The current Windows prerelease includes:

- `Minerva-Setup-Windows-x64-0.1.5-alpha.exe`
- `SHA256SUMS`
- `build-manifest.json`
- short [release notes](https://github.com/XdotX78/Minerva-Project/releases/tag/v0.1.5-alpha)

```bash
sha256sum -c SHA256SUMS
```

---

## Connect your AI and coding tools

Corax shares its memory with compatible tools through MCP (Model Context
Protocol): Claude Code, Cursor, Codex, OpenClaw and any other MCP client.

```bash
foundation connect <tool>
```

```bash
foundation connect cursor
foundation doctor cursor
```

Full connector list and per-client notes: [docs/clients.md](docs/clients.md).

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

## Backup

Your memory database is a regular file on disk. Back it up by copying the data
directory. No special export step is needed.

The database survives upgrades. Your memory is not reset when you update.

---

## Uninstall

On Windows, uninstall **Minerva** from Installed apps. Application files and the
Start menu shortcut are removed; the separate data, configuration, vault, and
logs are preserved.

On macOS and Linux, remove the `foundation` binary and bundled sidecars. The
data directory remains separate.

Check the [release notes](https://github.com/XdotX78/Minerva-Project/releases/latest) for the exact paths for your platform.

---

## Problems?

[Open an issue](https://github.com/XdotX78/Minerva-Project/issues) for install
failures, broken release assets, or compatibility reports.
