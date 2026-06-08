class Agentplane < Formula
  desc "CLI for auditable coding-agent workflows"
  homepage "https://github.com/basilisk-labs/agentplane"
  version "0.6.19"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/basilisk-labs/agentplane/releases/download/v0.6.19/agentplane-bun-v0.6.19-darwin-arm64.tar.gz"
    sha256 "cd7dfa66c600ace88d8dfea496b235a8e3288c5653589041d6bf584a0dc22883"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/basilisk-labs/agentplane/releases/download/v0.6.19/agentplane-bun-v0.6.19-darwin-x64.tar.gz"
    sha256 "13117781b2173987a0b8a94069881e1c4c37ad20aa0837aa07ce5c748e511634"
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
    assert_match "0.6.19", shell_output("#{bin}/agentplane --version")
    assert_match "agentplane", shell_output("#{bin}/agentplane --help")
  end
end
