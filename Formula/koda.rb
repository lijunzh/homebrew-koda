class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.1.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.19/koda-aarch64-apple-darwin.tar.gz"
      sha256 "5669134014d78368cd1cc4b8dcf32d514cf3ba3c0a8cd200c32dd062ee26e2a9"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.19/koda-x86_64-apple-darwin.tar.gz"
      sha256 "2094d4820d5bd7172d123ff6cb0b19c99b427d7a1e2d994c492830180e0b1a45"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.19/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c79e84ba62a344e13745d4ff8222855d17a4352da07b7e3b193bf830713840a3"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.19/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "155e6d69b2c52927b6a1f2e9a97352b4980bf11956fdec6d326619ad324ca0e9"
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
