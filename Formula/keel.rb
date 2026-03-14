# Homebrew formula for keel — structural code enforcement
# This template is updated by CI on each release.
# To use as a tap: brew tap FryrAI/keel && brew install keel

class Keel < Formula
  desc "Structural code enforcement for LLM coding agents"
  homepage "https://keel.engineer"
  version "0.4.1"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FryrAI/Keel/releases/download/v#{version}/keel-darwin-arm64"
      sha256 "1e2dc11b89bde1dfbb23fa9eae644b28dc370bd3e4f8527584a51334ea832bf6"
    else
      url "https://github.com/FryrAI/Keel/releases/download/v#{version}/keel-darwin-amd64"
      sha256 "e5c5e5998a86751cb5658877f779b0c104467c51d6920fe829f11ec5629d5d0b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FryrAI/Keel/releases/download/v#{version}/keel-linux-arm64"
      sha256 "fba7003a32c8d109cbf3e2685d3b539d579f02ae94acba08bfc6d67b8c349cac"
    else
      url "https://github.com/FryrAI/Keel/releases/download/v#{version}/keel-linux-amd64"
      sha256 "21afad0b8926b92734f6393cd0abd61227231149dc02ea832ae58ac43d625cac"
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
