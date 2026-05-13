# Minerva Project

<p align="center">
  <img src="assets/morgana-project-logo.png" alt="Morgana Project logo" width="420"/>
</p>


Minerva is a local memory system for LLMs.

The basic idea is simple: if you switch harness, client, editor, or coding
agent, your memory should come with you.

That sounds obvious, but most AI workflows still reset every time the session
ends or the tool changes. Context gets lost, decisions disappear, the same
reasoning gets repeated, and the model starts cold again.

Minerva exists to stop that.

It started from a familiar feeling: Obsidian is great for humans, but I wanted
something that played the same role for LLMs. Not a note vault for me to browse
by hand, but a memory layer an agent can search, recall, and carry across
sessions.

So the direction is not “better notes”. The direction is an AI-centric memory
system: local, fast, structured, and actually useful during real work.

Current alpha note:

- the public project name is Minerva
- the current CLI command is still `foundation`
- packaging and naming cleanup are still in progress
- public platform support is being expanded in stages

## What Minerva Tries To Be

Minerva is meant to be a durable memory substrate for AI systems.

That means:

- memory stays with you even if you change harness
- memory stays local on your machine
- retrieval is fast enough to be used constantly, not just occasionally
- agents can search both structured facts and longer documents
- the system is built for LLM use first, not for human-first browsing

This project is heavily shaped by the idea that models work better when memory
is treated as infrastructure, not as a chat transcript or a pile of notes.

## Built For LLM Work, Not Human Note-Taking

Minerva is not trying to replace Obsidian as a human writing tool.

The goal is different.

For humans, a good system helps you write, organize, connect, and revisit your
thoughts.

For LLMs, a good system should do something else:

- preserve decisions
- preserve preferences
- preserve project facts
- preserve relationships between things
- preserve long-form reference material without polluting active memory
- make all of that retrievable quickly and safely

That is the real target.

## Why It Is Fast

Minerva is written in Rust and designed around fast local retrieval.

The point is not just that Rust is fast in theory. The point is that memory only
matters if using it is cheap enough to become part of normal workflow.

If recall is slow, noisy, or expensive, people stop using it.

So Minerva is built around:

- local storage
- compact structured memory
- fast search paths for active recall
- a second document path for deeper fallback when needed

Normal work should hit structured memory first. Longer material should only come
in when the task actually needs it.

## Two Memory Layers

Minerva has two memory layers.

### 1. Structured memory

This is the fast path.

It is for things like:

- decisions
- insights
- preferences
- project facts
- relations between entities
- session continuity

This layer is what lets an LLM resume work without rebuilding the same context
again and again.

### 2. Document memory and RAG fallback

This is the deeper path.

Long-form material can still matter: plans, notes, documentation, references,
comparison docs, research text.

That material should remain searchable, but it should not flood the active
memory path.

So Minerva keeps a separate document layer and uses RAG-style fallback when the
agent needs deeper reference.

That split matters.

You want fast structured recall by default, and document retrieval only when the
question actually requires it.

## Search And Recall

Minerva is built around the idea that memory needs more than storage. It needs a
usable retrieval model.

The system is designed to support:

- fast recall of durable facts
- hybrid search across memory
- document search when structured memory is not enough
- continuity across sessions and tools

The result should feel less like “searching a notes folder” and more like
having a memory layer an agent can actually work with.

## Local By Default

Minerva is local-first.

That matters for two reasons:

- privacy
- reliability

Your memory lives on your machine.
The goal is to keep your working context under your control instead of building
around a hosted memory backend.

If you care about private context, long-lived projects, and continuity across
harnesses, this is the right default.

## Where This Is Going

The long-term direction is broad:

- more harnesses
- more clients
- more connectors
- more scaffolding paths
- better continuity across very different agent environments

But the rollout is intentionally incremental.

This is currently a one-developer project, so the right tradeoff is to keep the
system sharp and useful before making it wide.

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
curl -fsSL https://raw.githubusercontent.com/XdotX78/Minerva-Project/main/install.sh | bash
```

Windows PowerShell:

```powershell
irm https://raw.githubusercontent.com/XdotX78/Minerva-Project/main/install.ps1 | iex
```

Manual install:

1. Download the right archive from the latest release.
2. Extract it.
3. Move the `foundation` binary and bundled sidecars somewhere stable on your system.
4. Follow the release notes or compatibility docs for client setup.

The public rollout is still staged. Check the release notes to see which
platform assets are currently published before relying on the installer.

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
