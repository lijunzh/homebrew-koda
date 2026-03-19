class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.1.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.15/koda-aarch64-apple-darwin.tar.gz"
      sha256 "bfdbd2ed26f106ada1e8fb9ad193fceef5e5dcd67f10826db7cd636e923d050b"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.15/koda-x86_64-apple-darwin.tar.gz"
      sha256 "16ce39d11afc329dbc5019b276fb892fa833e4126504c6db9fc591cd0b69d99e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.15/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "01e7869712775ace5f11380ebd375a6bb95c688e44577d2ec9192beea2f5e224"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.15/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c70c46c91e0c918124cccdc3db1fbb77555944abe3b15e8c99c741541216a1d0"
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
