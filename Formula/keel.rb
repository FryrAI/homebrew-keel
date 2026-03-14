# Homebrew formula for keel — structural code enforcement
# This template is updated by CI on each release.
# To use as a tap: brew tap FryrAI/keel && brew install keel

class Keel < Formula
  desc "Structural code enforcement for LLM coding agents"
  homepage "https://keel.engineer"
  version "0.3.8"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FryrAI/Keel/releases/download/v#{version}/keel-darwin-arm64"
      sha256 "f6f9e47dbb211ed1ec14634c1d73b8872e2d7b4d3c8eb79a6243fdcbc769b3a1"
    else
      url "https://github.com/FryrAI/Keel/releases/download/v#{version}/keel-darwin-amd64"
      sha256 "973d5fa25dea1d89d89a63253ba22a6b709d980d48a4dde8681435344e0c7ce0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FryrAI/Keel/releases/download/v#{version}/keel-linux-arm64"
      sha256 "7e36aedec31b6e4792a0ae888537a47e80032558c733f5787b1913169337a41f"
    else
      url "https://github.com/FryrAI/Keel/releases/download/v#{version}/keel-linux-amd64"
      sha256 "ce4729479cf223fe90ac7691b1f97d4184e89cfba62e36718327b9a3157fad0f"
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
