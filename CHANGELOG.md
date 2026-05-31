# Changelog

## Unreleased

- No unreleased changes yet.

## 0.1.0-alpha.4 — 2026-05-31

### Relationship layer

- You can now model who knows who: store family roles (`parent_of`, `child_of`,
  `sibling_of`, `partner_of`), friendships, colleagues, and professional contacts
  as typed relations on the graph.
- New `person_card` MCP tool: ask for a person and get a compiled card — relations
  in both directions with correct role labels, social circles, last contact, and
  open threads, all in one call.
- New `foundation entity person-card <slug>` CLI command: same card locally,
  JSON output.
- Social circles: create a `group`-kind entity (family, friends, work team, hobby
  club) and connect people to it with `member_of`. The Minerva dashboard now shows
  group entities with a distinct chip color.
- Privacy: mark any entity `visibility=never_auto_surface` and it stays out of
  proactive suggestions — still reachable on explicit recall.

### Service and dashboard

- `foundation serve` — one command starts Minerva and the Foundation read API on
  the same port. No separate processes.
- `foundation start` / `stop` / `restart` / `dashboard` / `logs` — service
  control from the terminal.
- `foundation update` — pull the latest public release in one command. Pin a
  version with `--version TAG` or refresh from a local binary with `--path`.
- `./install.sh` — end-to-end setup from a repo checkout or a release bundle:
  dependencies, dashboard build, install, service start, dashboard open.
- Linux `systemd --user` service support for always-on local operation. Optional
  private-network access via Tailscale/WireGuard.

## 0.1.0-alpha.3

- Added public logo and refreshed README positioning.
- Public release assets now cover Linux x86_64, macOS Apple Silicon, and Windows x86_64.
- Install docs and compatibility notes updated to reflect the current public alpha reality.

## 0.1.0-alpha.1

- Initial public distribution repository.
- Public README with product direction and scope.
- Install, compatibility, and release documentation scaffold.
- No public binaries yet in this first alpha release.
