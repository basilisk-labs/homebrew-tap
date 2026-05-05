class Agentplane < Formula
  desc "CLI for auditable coding-agent workflows"
  homepage "https://github.com/basilisk-labs/agentplane"
  version "0.4.4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/basilisk-labs/agentplane/releases/download/v0.4.4/agentplane-bun-v0.4.4-darwin-arm64.tar.gz"
    sha256 "7bb81d0b66b7f59a62ecbb5e83fa67f6f8344ac65b9f39447d76c2448c0b44cf"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/basilisk-labs/agentplane/releases/download/v0.4.4/agentplane-bun-v0.4.4-darwin-x64.tar.gz"
    sha256 "379438dbd3c3afab6d476211f0a956e9d4682269e398c7557cd46ca62f16bb93"
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
    assert_match "0.4.4", shell_output("#{bin}/agentplane --version")
    assert_match "agentplane", shell_output("#{bin}/agentplane --help")
  end
end
