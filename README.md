# Basilisk Labs Homebrew Tap

Homebrew formulas for Basilisk Labs tools.

**Topics:** `agentplane` `homebrew` `cli` `packaging`

## Why install AgentPlane from this tap

If you are building AI-native engineering workflows, AgentPlane gives you:

- auditable task execution contracts,
- consistent local/CI behavior,
- a release-driven installation model.

The tap keeps `agentplane` versioned as a normal Homebrew package, with updates aligned to upstream release metadata.

## Install

```bash
brew install basilisk-labs/tap/agentplane
```

Or add the tap first:

```bash
brew tap basilisk-labs/tap
brew install agentplane
```

## Verify

```bash
agentplane --version
agentplane quickstart
```

If this is the first time, run quickly and compare output against your repository conventions.

## Update policy

- Formula metadata (`url`, `sha256`, `version`) is refreshed from the release pipeline.
- `livecheck` automatically tracks new upstream AgentPlane versions.
- Keep the formula checked-in with release PRs only.

## Maintenance notes

- Validate locally before publishing updates.
- Prefer release-driven updates over manual drift.
