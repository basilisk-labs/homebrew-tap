class Agentplane < Formula
  desc "Git-native CLI harness for auditable coding-agent workflows"
  homepage "https://agentplane.org"
  url "https://registry.npmjs.org/agentplane/-/agentplane-0.4.1.tgz"
  sha256 "76edd130dceddb1d15313a5feb3819c513c815b350b9abc822b3ea4712ccc74b"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match "0.4.1", shell_output("#{bin}/agentplane --version")
    assert_match "agentplane", shell_output("#{bin}/agentplane --help")
  end
end
