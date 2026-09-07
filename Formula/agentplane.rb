class Agentplane < Formula
  desc "CLI for auditable coding-agent workflows"
  homepage "https://github.com/basilisk-labs/agentplane"
  version "0.7.8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/basilisk-labs/agentplane/releases/download/v0.7.8/agentplane-bun-v0.7.8-darwin-arm64.tar.gz"
    sha256 "e53d08c09c6c9668cbbca8f264bacb4fe5f57529f73b5c40398fee7cadbe436a"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/basilisk-labs/agentplane/releases/download/v0.7.8/agentplane-bun-v0.7.8-darwin-x64.tar.gz"
    sha256 "664f34f775b767a2fa2ae3edb5f7f29521db870387f9077aa23a40e4dd4b09ed"
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
    assert_match "0.7.8", shell_output("#{bin}/agentplane --version")
    assert_match "agentplane", shell_output("#{bin}/agentplane --help")
  end
end
