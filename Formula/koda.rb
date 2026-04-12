class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.2.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.10/koda-aarch64-apple-darwin.tar.gz"
      sha256 "da701827be668c77dc3f15b14496132695f476cf203da8da1872033779efc17c"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.10/koda-x86_64-apple-darwin.tar.gz"
      sha256 "735af1ace92b535b73a3744d7c14ac7db810cdf2aea66be571a2947a8506855e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.10/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "61fd836e5b8f08df378a0863ded4762c3547d02c72d1fcbbdb8a72475334e8ef"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.10/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6c55693c0fff6d778558eef0d5030d15a0e84e79aa0a0824796b301ac1ba8754"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
