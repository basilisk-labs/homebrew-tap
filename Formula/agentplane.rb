class Agentplane < Formula
  desc "CLI for auditable coding-agent workflows"
  homepage "https://github.com/basilisk-labs/agentplane"
  version "0.4.2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/basilisk-labs/agentplane/releases/download/v0.4.2/agentplane-v0.4.2-darwin-arm64.tar.gz"
    sha256 "7c7ba2f08ddd1a660fc3c39de3bd76285df67f53bd04ed3477f3a90a5df09af8"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/basilisk-labs/agentplane/releases/download/v0.4.2/agentplane-v0.4.2-darwin-x64.tar.gz"
    sha256 "49372fff89c536e16529be32689278e4f63238763b691ef1a8c168c66fe19bcb"
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
    assert_match "0.4.2", shell_output("#{bin}/agentplane --version")
    assert_match "agentplane", shell_output("#{bin}/agentplane --help")
  end
end
