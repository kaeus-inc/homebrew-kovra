# homebrew-kovra

Homebrew tap for [**kovra**](https://kovra.sh) — a local secrets manager for
development that lets your tools and AI agents *use* your secrets without ever
*seeing* them.

## Install

```bash
brew install kaeus-inc/kovra/kovra
```

That is shorthand for tapping this repo and installing the `kovra` formula. The
formula builds the `kovra` binary from source (Rust) off the public open-core
repo [`kaeus-inc/kovra-core`](https://github.com/kaeus-inc/kovra-core).

## Updating

The formula is bumped automatically on each kovra release by the
`release-homebrew` workflow in `kovra-core`. To upgrade:

```bash
brew update && brew upgrade kovra
```

---

kovra is a product of **Kaeus Inc**. Source-available under the Business Source
License 1.1.
