class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.3/koda-aarch64-apple-darwin.tar.gz"
      sha256 "54a799caaa285a9102d004ee77e28b57674ce492c1c9fcc953d0d9a0f23c3d0b"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.3/koda-x86_64-apple-darwin.tar.gz"
      sha256 "2706567f99950366ede6ec8f381274c15f2758f6eccfafaefc8f1cd9d9a4ed88"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.3/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3d9e15cc5e86b0c4a1877e414bd3c7733720cdf794546aee6d0bbec2f459c5fe"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.3/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e54c94e70a4beb6af2de84fde9d6c606e94ca257e2af85d25affe98f204c6da5"
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
