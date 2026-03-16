class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.1.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.12/koda-aarch64-apple-darwin.tar.gz"
      sha256 "2668bbcb9c674bc8d34ff9f8e7db8f2f0abb473cd67a93018bacb3266f020168"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.12/koda-x86_64-apple-darwin.tar.gz"
      sha256 "cfb118631972ad9965a25c5d06f07232d310ece51ae16ec6eb78771ee9e5dfea"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.12/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4f5797977189934795d25bd0413d0fdca1d6c6f51b4849c2701a959f452abf56"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.12/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5eaa02a28b92ce295cc503a1e9731d77f2e1d8720212791caa691ef5cae85923"
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
