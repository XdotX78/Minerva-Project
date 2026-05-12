# Minerva Project

Minerva is a local memory layer for LLM agents.

The goal is simple: help agents remember useful context across sessions, instead
of starting from zero every time.

Minerva is built for agent workflows, not for human note-taking. It is meant to
store useful memory in a structured way so tools and coding agents can recover
context, decisions, preferences, and project history when they need it.

## Why This Exists

Most agent workflows break in the same place:

- the session ends
- useful context is lost
- the next session starts cold
- the same reasoning gets repeated

Minerva exists to reduce that loss.

## What You Get Here

This is the public distribution repository for Minerva.

It contains:

- public releases
- install instructions
- checksums
- compatibility notes
- issue tracking for install and release problems

It does not contain the application source code.

## Install

The intended path is: download a release and install the binary.

Linux and macOS:

```bash
curl -fsSL https://raw.githubusercontent.com/Minerva-Project/Minerva-Project/main/install.sh | bash
```

Manual install:

1. Download the right archive from the latest release.
2. Extract it.
3. Move the `minerva` binary somewhere stable on your system.
4. Follow the release notes or compatibility docs for client setup.

For now, the install script is still a placeholder until the first public
binary release is wired up.

## Verify Downloads

Each public release should include:

- platform archives
- `SHA256SUMS`
- short release notes

Verify downloaded files before installing:

```bash
sha256sum -c SHA256SUMS
```

## Support

Use this repository for:

- install failures
- broken release assets
- compatibility reports
- documentation fixes

This repository is for distribution and usage, not for public source
contributions.

## License

Minerva binaries and documentation are distributed under the terms published in
the release and repository metadata. The source code remains private.
