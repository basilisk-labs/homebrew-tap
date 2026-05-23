class Agentplane < Formula
  desc "CLI for auditable coding-agent workflows"
  homepage "https://github.com/basilisk-labs/agentplane"
  version "0.6.7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/basilisk-labs/agentplane/releases/download/v0.6.7/agentplane-bun-v0.6.7-darwin-arm64.tar.gz"
    sha256 "9c8fd5d0a0a45c927d608a59a3251ff7e82a8458a61243a45d809772bd72a839"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/basilisk-labs/agentplane/releases/download/v0.6.7/agentplane-bun-v0.6.7-darwin-x64.tar.gz"
    sha256 "d9fadcbf5038b1822512d1af7340dba9a9527b060525fd6c458793bc253836ed"
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
    assert_match "0.6.7", shell_output("#{bin}/agentplane --version")
    assert_match "agentplane", shell_output("#{bin}/agentplane --help")
  end
end
