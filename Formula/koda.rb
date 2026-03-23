class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.1.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.18/koda-aarch64-apple-darwin.tar.gz"
      sha256 "6d73564710ab110284d5e50e2fa450afa62baaec215f3647a51e23755807cd7d"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.18/koda-x86_64-apple-darwin.tar.gz"
      sha256 "8a95c7b63bff9c825698c3b7dcbb998b784729bef2434b6da1bc791f4aefd36b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.18/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "28caf608793d062b2a282ae70b1bb716a558acc9afb9fd754b1002036b6099d2"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.18/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b3ab2ac87a84149af5875a72d8107b83a1e9de175886fbc729bfc8ea25fb7f53"
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
