class Agentplane < Formula
  desc "CLI for auditable coding-agent workflows"
  homepage "https://github.com/basilisk-labs/agentplane"
  version "0.7.13"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/basilisk-labs/agentplane/releases/download/v0.7.13/agentplane-bun-v0.7.13-darwin-arm64.tar.gz"
    sha256 "8a95c0c428715323be132b2214d90e295aa655e9a9e8a40ca051bc5c5180ff64"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/basilisk-labs/agentplane/releases/download/v0.7.13/agentplane-bun-v0.7.13-darwin-x64.tar.gz"
    sha256 "b1c16dddb2dc500a5e35c94b5b96584c1807e0fbad15e017634ff5a34c02d1e9"
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
    # Homebrew stages inside the archive's single top-level bin directory.
    libexec.install "agentplane"
    bin.install_symlink libexec/"agentplane" => "agentplane"
    bin.install_symlink libexec/"agentplane" => "ap"
  end

  test do
    assert_match "0.7.13", shell_output("#{bin}/agentplane --version")
    assert_match "agentplane", shell_output("#{bin}/agentplane --help")
    assert_match "0.7.13", shell_output("#{bin}/ap --version")
    assert_match "agentplane", shell_output("#{bin}/ap --help")
  end
end
