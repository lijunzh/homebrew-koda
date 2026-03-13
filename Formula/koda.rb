class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.1.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.8/koda-aarch64-apple-darwin.tar.gz"
      sha256 "a3e6bfc3b537e27b1a7e0b91fc1480dc895d47516d91686dbcab52b98058040a"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.8/koda-x86_64-apple-darwin.tar.gz"
      sha256 "cf3dc9f7421185c415aca3f4a04025a1d47585581e105c57e5ad182baf8bd9ab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.8/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "433a4f0b0cc27f9fd48958f8bf65cb067952756425c1c7597621f945096d607b"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.8/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "141148f967f6a5af084f815ef4890f6b552d265a9cb473241382ac67cd48ee93"
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
