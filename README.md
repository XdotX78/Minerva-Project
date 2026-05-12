# Minerva Project

Public distribution repository for Minerva.

Minerva is a local-first memory substrate for LLM agents. The source code is
private. This repository exists only for public releases, install instructions,
checksums, issue tracking, and compatibility notes.

## What This Repo Contains

- release install instructions
- public changelog and release notes
- compatibility and setup docs
- checksums and verification guidance
- issue reporting surface

## What This Repo Does Not Contain

- application source code
- internal architecture details beyond what is needed for installation
- private build scripts
- development history

## Install

Install from the latest release asset.

Linux and macOS:

```bash
curl -fsSL https://raw.githubusercontent.com/Minerva-Project/Minerva-Project/main/install.sh | bash
```

Manual install is also supported:

1. Download the correct archive from the latest release.
2. Extract the archive.
3. Run the included `minerva` binary.
4. Connect your client using the release docs.

## Verify

Each release should publish:

- `SHA256SUMS`
- per-platform archives
- concise release notes

Verify before installing:

```bash
sha256sum -c SHA256SUMS
```

## Support

Use GitHub issues in this repository for:

- install failures
- release asset problems
- compatibility reports
- documentation issues

Do not expect source-code contributions through this repository.

## License

Minerva binaries and documentation are distributed under the terms published in
the release and repository metadata. Source code remains private.
