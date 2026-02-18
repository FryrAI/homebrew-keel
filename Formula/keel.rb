# Homebrew formula for keel — structural code enforcement
# Updated automatically by CI on each release.
# To install: brew tap FryrAI/tap && brew install keel

class Keel < Formula
  desc "Structural code enforcement for LLM coding agents"
  homepage "https://keel.engineer"
  version "0.1.0"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FryrAI/Keel/releases/download/v#{version}/keel-darwin-arm64"
      sha256 "7288ca8804c5baaf6679ef3b73573afdb90fa2133156dbc9d33209f37c979da5"
    else
      url "https://github.com/FryrAI/Keel/releases/download/v#{version}/keel-darwin-amd64"
      sha256 "5c49bf6419bd6b7ce1da883e00f8026132ee254f305e129ae953e8306262c336"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FryrAI/Keel/releases/download/v#{version}/keel-linux-arm64"
      sha256 "a1d9cb625fba45addc067cce53b5da87a3871eea2e982e62df09dba1f75ebccf"
    else
      url "https://github.com/FryrAI/Keel/releases/download/v#{version}/keel-linux-amd64"
      sha256 "8e1a16d26c80f402217da518fead0c9872b1cac47aad8f56f41ac37fd6e284d4"
    end
  end

  def install
    binary = Dir["keel-*"].first || "keel"
    bin.install binary => "keel"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/keel --version")
  end
end
