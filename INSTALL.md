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

Windows has a normal installer: one file, double click, done. macOS and
Linux install with the script below; which assets are published can vary from
release to release.

> **About the name.** The product is called Corax. The command-line tool is
> called `foundation`, and older releases were named **Minerva**. Same product.

---

## Windows

You need Windows 10 or 11 (64-bit) and an administrator account (the one
you normally use on your own PC is fine).

1. **Download.** Open the [latest release](https://github.com/XdotX78/Minerva-Project/releases/latest)
   and click `Corax-Setup-<version>.exe` (for example `Corax-Setup-0.2.0-alpha.exe`).
2. **Double click** the downloaded file (you find it in **Downloads**).
3. **If a blue window says "Windows protected your PC"**
   (in Italian: «Windows ha protetto il PC»): click **More info**
   («Ulteriori informazioni»), then **Run anyway** («Esegui comunque»).
   This appears because the alpha setup is not signed with a paid certificate yet.
4. **Windows asks "Do you want to allow this app to make changes?"**
   («Vuoi consentire a questa app di apportare modifiche?»): click **Yes** («Sì»).
5. Wait a minute. When the setup closes, Corax opens in your browser.

That's it. From now on:

- Open Corax with the **Corax** icon on the Desktop or in the Start menu.
- Corax starts by itself when the PC is switched on, even before anyone logs in.
  Leave the PC on and Corax stays reachable.
- Nothing else to install: no terminal, Rust, Node, Git or Docker.

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

On Windows, the setup installs Corax in `C:\Program Files\Corax`, keeps your
data in `C:\ProgramData\foundation`, runs Corax as the Windows service
`FoundationBrain`, and opens the dashboard in your browser. On macOS and Linux,
the install script performs the equivalent setup.

Manual install (macOS and Linux):

1. Download the right archive from the [latest release](https://github.com/XdotX78/Minerva-Project/releases/latest).
2. Extract it.
3. Move the `foundation` binary and bundled sidecars somewhere stable.
4. Follow the [release notes](https://github.com/XdotX78/Minerva-Project/releases/latest) for client setup.

The rollout is staged. Check the [release notes](https://github.com/XdotX78/Minerva-Project/releases/latest)
to confirm which platform assets are published before relying on the installer.

---

## Verify downloads

A Windows release includes:

- `Corax-Setup-<version>.exe`
- `latest.json` (what the **Update now** button reads; signed by us)
- `SHA256SUMS`
- `build-manifest.json`
- short release notes

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

On Windows: open Corax, go to **Settings**, and click **Update now** when a new
version is shown (Admin only). Corax downloads the new setup, checks that it is
signed by us and installs it by itself; the page comes back after a short pause.
An unsigned or older version is never installed.

You can also download the newer `Corax-Setup-<version>.exe` and double click it,
as for the first install. Your data is kept either way.

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
directory. No special export step is needed. On Windows the data directory is
`C:\ProgramData\foundation`; stop Corax first (`foundation stop` in an
administrator terminal) so the copy is complete.

The database survives upgrades. Your memory is not reset when you update.

---

## Uninstall

On Windows, open **Settings → Apps → Installed apps**, find **Corax** and click
**Uninstall**. The program, the service and the shortcuts are removed; your data
in `C:\ProgramData\foundation` is kept, so reinstalling finds everything. To
remove the data too, delete that folder after uninstalling.

On macOS and Linux, remove the `foundation` binary and bundled sidecars. The
data directory remains separate.

Check the [release notes](https://github.com/XdotX78/Minerva-Project/releases/latest) for the exact paths for your platform.

---

## Problems?

[Open an issue](https://github.com/XdotX78/Minerva-Project/issues) for install
failures, broken release assets, or compatibility reports.
