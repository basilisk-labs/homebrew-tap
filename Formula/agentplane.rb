class Agentplane < Formula
  desc "CLI for auditable coding-agent workflows"
  homepage "https://github.com/basilisk-labs/agentplane"
  version "0.4.3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/basilisk-labs/agentplane/releases/download/v0.4.3/agentplane-v0.4.3-darwin-arm64.tar.gz"
    sha256 "fa0ee43b3a74e2d6be6d0dc21f1bf41c263ffcbedb4ee8b857a8722004ee059d"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/basilisk-labs/agentplane/releases/download/v0.4.3/agentplane-v0.4.3-darwin-x64.tar.gz"
    sha256 "af56277e4c81193f4dcf31c4a4a0321151b8fe0f3820ddeea2c46bca856c1d1d"
  else
    odie "AgentPlane Homebrew formula currently supports macOS arm64 and x86_64 standalone archives"
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
    assert_match "0.4.3", shell_output("#{bin}/agentplane --version")
    assert_match "agentplane", shell_output("#{bin}/agentplane --help")
  end
end
