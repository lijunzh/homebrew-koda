class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.0/koda-aarch64-apple-darwin.tar.gz"
      sha256 "72542360c7b5c10e133ecab581f0f0f286874eebf8eec4dfab548292dd903d73"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.0/koda-x86_64-apple-darwin.tar.gz"
      sha256 "e7c7e6cd802c0ce3377f199b583695e0c8edb30e77e6558088c9ea154a1c81ca"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.0/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9906db20b0ea4c9a629d27a5be72709b51931da5411d0b13597df19c5c6a49bc"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.0/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e6bcaa1ce0fb9eef1f7d7e60b526fa2c36b4ee1294b05d524f5c108752ccdcca"
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
