# Architecture

How Minerva runs, and why it stays fast. See the [README](../README.md) for
the short version.

## Why it is fast

Minerva is written in Rust and built around fast local retrieval. Memory only
matters if using it is cheap enough to become part of normal workflow. If recall
is slow or noisy, people stop using it.

The design is: local storage, compact structured memory, fast search paths for
active recall, and a document path for deeper fallback when needed. See
[memory.md](memory.md) for how those two paths work.

Normal work hits structured memory first. Longer material comes in only when
the task actually needs it.

## Local-first, not only localhost

Your data lives on your machine, under your control. Minerva runs as a local
service — the dashboard, the assistant, and the MCP server are all one process
on your box, not a call to someone else's API.

Local-first does not mean locked to localhost, though. Minerva can be reached
from another machine on the same private network or over a VPN or Tailnet.
Useful when you want to talk to Minerva from your phone, or your editor needs
to reach the same memory server from a different machine.

Minerva does not expose a raw public endpoint. If you route it over a private
network or Tailscale, that is your call. The default is local.
