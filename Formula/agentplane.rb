class Agentplane < Formula
  desc "CLI for auditable coding-agent workflows"
  homepage "https://github.com/basilisk-labs/agentplane"
  version "0.4.2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/basilisk-labs/agentplane/releases/download/v0.4.2/agentplane-v0.4.2-darwin-arm64.tar.gz"
    sha256 "8bc19b2a29a48a350d283153156644e8128cd05e49cd1a02513659a5aa95759b"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/basilisk-labs/agentplane/releases/download/v0.4.2/agentplane-v0.4.2-darwin-x64.tar.gz"
    sha256 "a538cc7d91ff55fbf2c1dbc969782500d8a5c5ed1e0b9a50e2530616957f2083"
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
