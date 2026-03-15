class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.1.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.11/koda-aarch64-apple-darwin.tar.gz"
      sha256 "9830c37f3c4dcc3015415d1b13f2a6f0e94d18cca959b1c601612a28c86b2d51"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.11/koda-x86_64-apple-darwin.tar.gz"
      sha256 "bf1f55cc55f99110602bf8567dff2269c3659785b3939b2f08ae076e1b8db5af"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.11/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "efff5548d3d77d205e8e39152d9cb8323668ee7241e087064d17afeaa3db39b8"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.11/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d62c2ade04c4af6ee801cbbf4338a8851de6ba325890ef0542aef1d2e55c5590"
    end
  end

  def install
    bin.install "koda"
    bin.install "koda-ast"
    bin.install "koda-email"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
    assert_match "koda-ast", shell_output("#{bin}/koda-ast --version 2>&1", 1)
  end
end
