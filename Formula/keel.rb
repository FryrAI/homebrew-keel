# Homebrew formula for keel — structural code enforcement
# This template is updated by CI on each release.
# To use as a tap: brew tap FryrAI/keel && brew install keel

class Keel < Formula
  desc "Structural code enforcement for LLM coding agents"
  homepage "https://keel.engineer"
  version "0"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FryrAI/Keel/releases/download/v#{version}/keel-darwin-arm64"
      sha256 "159036b524b6ad8fa56a02f127d46a0979b1d5f7ed9757f9d0343ca3ec40a06e"
    else
      url "https://github.com/FryrAI/Keel/releases/download/v#{version}/keel-darwin-amd64"
      sha256 "d34fb600f649e7c9add8e4db3744f7eb5aaefdc03865ddfab421dc9bb0e040f7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FryrAI/Keel/releases/download/v#{version}/keel-linux-arm64"
      sha256 "4ac43d7592337866f424761f389874975c5ebc071821727379ab56a1a4a1c798"
    else
      url "https://github.com/FryrAI/Keel/releases/download/v#{version}/keel-linux-amd64"
      sha256 "466fbb27a34d6f2edba38ea499caaab0bf9314454c2887bc250d342be204487b"
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
