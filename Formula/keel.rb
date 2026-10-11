# Homebrew formula for keel — structural code enforcement
# This template is updated by CI on each release.
# To use as a tap: brew tap FryrAI/keel && brew install keel

class Keel < Formula
  desc "Structural code enforcement for LLM coding agents"
  homepage "https://keel.engineer"
  version "0.7.2"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FryrAI/Keel/releases/download/v#{version}/keel-darwin-arm64"
      sha256 "c049ba6418311b18a83af6c888f7a4e66dbc0cdad6cd89e95267f8c9120d8576"
    else
      url "https://github.com/FryrAI/Keel/releases/download/v#{version}/keel-darwin-amd64"
      sha256 "a69152ec5c7cf6fe2ad6eb2fffc6098f200e9b5cc73916739e3bf2c8025dd951"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FryrAI/Keel/releases/download/v#{version}/keel-linux-arm64"
      sha256 "7551ac49163efbd67cdae82b410c91c87270badb98c8666e7b09cf3e04ef18be"
    else
      url "https://github.com/FryrAI/Keel/releases/download/v#{version}/keel-linux-amd64"
      sha256 "3ecaf60b4e0f3c781b58e87ec0b596cec082355232046ee64ffe0f378c8f91c2"
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
