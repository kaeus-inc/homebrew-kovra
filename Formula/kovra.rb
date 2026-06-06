# typed: strict
# frozen_string_literal: true

# kovra — Homebrew formula (KOV-49, Pillar 3 — distribution & install).
#
# Tap: kaeus-inc/kovra  →  users install with `brew install kaeus-inc/kovra/kovra`.
#
# Build-from-source Rust formula: `cargo install` the `kovra` binary (the crate
# at crates/cli publishes as `kovra` and produces the `kovra` bin). `url` points
# at the GitHub release source tarball for the tag; `sha256` is the digest of
# that tarball. Pinned to the public-debut tag v0.8.2 at go-live (KOV-51).
# Subsequent releases bump `url`/`sha256` automatically via release-homebrew.yml
# (`brew bump-formula-pr`). Homebrew builds from source and does not depend on
# crates.io.
class Kovra < Formula
  desc "Local secrets manager for development, exposed over MCP for AI agents"
  homepage "https://kovra.sh"
  url "https://github.com/kaeus-inc/kovra-core/archive/refs/tags/v0.8.2.tar.gz"
  sha256 "bf73c68fb7429552dd034762bd3c31ce371c4d57a46f059557d5e56ba81f22a4"
  license "BUSL-1.1"
  head "https://github.com/kaeus-inc/kovra-core.git", branch: "main"

  depends_on "rust" => :build

  def install
    # The published crate is `kovra` (bin `kovra`); build it from the workspace.
    system "cargo", "install", "--locked", "--path", "crates/cli", "--root", prefix
  end

  test do
    assert_match "kovra", shell_output("#{bin}/kovra --version")
  end
end
