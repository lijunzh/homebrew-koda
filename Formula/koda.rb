class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.2.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.4/koda-aarch64-apple-darwin.tar.gz"
      sha256 "15f3d706e6b7e0758cfafc0a5939c2ff61c4dd61a9d2f29e9875afd993496706"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.4/koda-x86_64-apple-darwin.tar.gz"
      sha256 "972c9c51c245addbdf47461cc48eb12e0716863977983bcb978d2536176ca018"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.4/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dd99b52daa0553fd972c652dad871d27b22a5e819eec3e7239f683f2e1e529c4"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.4/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4d5c56db53cb38af74816a2e01a1f258d218c1b9c8eb43adb770b04c7f94a44f"
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
