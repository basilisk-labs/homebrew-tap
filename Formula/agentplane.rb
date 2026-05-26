class Agentplane < Formula
  desc "CLI for auditable coding-agent workflows"
  homepage "https://github.com/basilisk-labs/agentplane"
  version "0.6.10"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/basilisk-labs/agentplane/releases/download/v0.6.10/agentplane-bun-v0.6.10-darwin-arm64.tar.gz"
    sha256 "dcfa0b9c05bdf9d6f310e981241e254b37dcd60fcf2e3480d51a9f06192def0a"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/basilisk-labs/agentplane/releases/download/v0.6.10/agentplane-bun-v0.6.10-darwin-x64.tar.gz"
    sha256 "98d5e47b5f64be30af1c56b7673d06b23f238d02919429cb2130d2a86849b8a1"
  else
    odie "AgentPlane Homebrew formula currently supports macOS arm64 and x86_64 Bun executable archives"
  end

  livecheck do
    url "https://api.github.com/repos/basilisk-labs/agentplane/releases/latest"
    strategy :json do |json|
      json["tag_name"]&.gsub(/^v/, "")
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/agentplane" => "agentplane"
  end

  test do
    assert_match "0.6.10", shell_output("#{bin}/agentplane --version")
    assert_match "agentplane", shell_output("#{bin}/agentplane --help")
  end
end
