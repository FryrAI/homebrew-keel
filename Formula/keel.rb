# Homebrew formula for keel — structural code enforcement
# This template is updated by CI on each release.
# To use as a tap: brew tap FryrAI/keel && brew install keel

class Keel < Formula
  desc "Structural code enforcement for LLM coding agents"
  homepage "https://keel.engineer"
  version "0.2.0"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FryrAI/Keel/releases/download/v#{version}/keel-darwin-arm64"
      sha256 "1402a3235b20d2cf2568cbb14d6e5952839edca3d08087a59f23f40c2c568600"
    else
      url "https://github.com/FryrAI/Keel/releases/download/v#{version}/keel-darwin-amd64"
      sha256 "c4ab29217af1158074ab282de592f6444b5b61c399ce0b3d887497a670e58480"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FryrAI/Keel/releases/download/v#{version}/keel-linux-arm64"
      sha256 "af951ca461d37ab3354f730b0cca63e7773c8ab34f69299218bb8974eaea87e2"
    else
      url "https://github.com/FryrAI/Keel/releases/download/v#{version}/keel-linux-amd64"
      sha256 "3ebe8bb5eb100a421e1b89fbc2997f367cc68033432ad653b06a2143e4dd003b"
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
