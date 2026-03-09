class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.4/koda-aarch64-apple-darwin.tar.gz"
      sha256 "4e7ded750d65b18663b4f926e6371c1e009ca85cbafc43b8ffcdfb8ab071d940"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.4/koda-x86_64-apple-darwin.tar.gz"
      sha256 "25cf059d034f40e881391c6b566c9de6986ad3be7f17e5e283bf1c2e45701495"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.4/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c6c586c2766c2c76ebdcd98773ad6248450d74a423ef2fafca87afe21050a851"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.4/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "40034a937ce4c55005658f99bb6547d07cc9b5b9662456916f24e1423a73d7db"
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
