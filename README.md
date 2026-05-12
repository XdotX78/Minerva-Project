# Minerva Project

Minerva is a local memory system for LLM agents.

If you change harness, client, or coding tool, your memory should not reset.
That is the point of Minerva.

Minerva keeps useful memory on your machine so agents can carry context across
sessions and across tools instead of starting from zero every time.

It is built for agent workflows, not for human note-taking.

Current alpha note:

- the public project name is Minerva
- the current CLI command is still `foundation`
- wider packaging and naming cleanup will come later
- public packaged targets are being expanded in stages

## What Minerva Is

Minerva is designed around a few simple ideas:

- your memory should stay with you, even if you switch harness
- your data should stay local
- memory retrieval should be fast
- agents should get both structured memory and document-level fallback when needed

In practice, that means:

- local-first storage
- no cloud dependency for core memory
- one memory layer shared across different agent environments
- structured memory for fast recall
- a second document/RAG layer for long-form material when needed

## Why This Exists

Most agent workflows break in the same place:

- the session ends
- useful context is lost
- the next session starts cold
- the same reasoning gets repeated

Minerva exists to stop that from happening.

If you used one setup yesterday and a different one today, you should still be
able to bring your memory with you.

## Local, Private, Fast

Minerva is meant to run locally.

The direction is:

- your memory lives on your machine
- your private context stays under your control
- switching tools should not mean losing continuity
- retrieval should stay quick enough to be useful in real work

The privacy model is simple: keep the memory local by default, instead of
building around a hosted service.

## Two Memory Layers

Minerva has two different memory paths:

1. structured memory for active recall
2. document memory for long-form fallback

The first layer is for things like:

- decisions
- preferences
- project facts
- relationships
- session continuity

The second layer is for longer material that should still be searchable when
needed, without turning the whole system into a document vault.

That combination matters: fast structured memory for normal use, and RAG for
deep reference when the task actually needs it.

## Project Status

Minerva is still early.

The direction is broad, but the implementation is being built incrementally:

- start with the most useful local workflows
- expand compatibility over time
- improve install and setup before widening the surface too much

This is currently a one-developer project, so support will expand in stages
rather than all at once.

The long-term goal is to support as many useful runtimes, harnesses,
connectors, and scaffolding paths as possible, but the rollout has to stay
practical and incremental.

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

Windows PowerShell:

```powershell
irm https://raw.githubusercontent.com/Minerva-Project/Minerva-Project/main/install.ps1 | iex
```

Manual install:

1. Download the right archive from the latest release.
2. Extract it.
3. Move the `foundation` binary and bundled sidecars somewhere stable on your system.
4. Follow the release notes or compatibility docs for client setup.

The first installable public wave is still staged. Check the release notes to
see which platform assets are published before relying on the installer.

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
