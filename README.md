# Basilisk Labs Homebrew Tap

Homebrew formulas for Basilisk Labs tools.

**Topics:** `agentplane` `homebrew` `cli` `packaging`

## AgentPlane

Install AgentPlane from the tap:

```bash
brew install basilisk-labs/tap/agentplane
```

Or add the tap first if you keep formulas separate:

```bash
brew tap basilisk-labs/tap
brew install agentplane
```

This tap is generated from AgentPlane release distribution metadata.

## Discovery chips

- `agentplane`
- `cli`
- `standalone`
- `workflow`

## Verification

You can verify installation:

```bash
agentplane --version
agentplane quickstart
```

## Lifecycle

- Formula version matches AgentPlane release artifacts.
- `livecheck` in `Formula/agentplane.rb` tracks new AgentPlane releases automatically.
- Updates arrive via the AgentPlane publish workflow.

## Maintenance

- Keep release metadata (`url`/`sha256`/`version`) in sync with npm releases.
- Use GitHub releases notes on every package bump.
