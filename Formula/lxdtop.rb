class Lxdtop < Formula
  desc "Live, btop-style view of an LXD host, plus an SSH helper to run it"
  homepage "https://github.com/bjhinkle/lxdtop"
  url "https://github.com/bjhinkle/lxdtop/archive/refs/tags/v1.10.0.tar.gz"
  sha256 "833e878ba52656e2df1396e4d7a262728a1155c47363312b1ff2d98f8124b025"
  license "MIT"

  def install
    # lxdtop runs on the LXD host, not here, so only lxdtop-remote goes on the PATH.
    # lxdtop-remote sends this lxdtop to hosts, so it is installed unchanged.
    libexec.install "lxdtop", "contrib/lxdtop-remote"
    (bin/"lxdtop-remote").write_env_script libexec/"lxdtop-remote", LXDTOP: opt_libexec/"lxdtop"
  end

  def caveats
    <<~EOS
      lxdtop runs on the LXD host, not on this machine. To copy it to a host and watch it:
        lxdtop-remote install myhost
        lxdtop-remote myhost
    EOS
  end

  test do
    assert_match "lxdtop #{version}", shell_output("#{libexec}/lxdtop --version")
    assert_match "usage: lxdtop-remote install", shell_output("#{bin}/lxdtop-remote install 2>&1", 2)
  end
end
