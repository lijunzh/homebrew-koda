class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.1.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.10/koda-aarch64-apple-darwin.tar.gz"
      sha256 "5dfa90e5746d9e8ee0139c6529329109b4033d299070370194628b841e030239"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.10/koda-x86_64-apple-darwin.tar.gz"
      sha256 "c7bf392aae82aa84ba4fb47e65cc67f26b5c0ecabb970e4b9cea25e2261091b8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.10/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e3dbe9988d5d297124ba936a616cca70593e4ef80ea968325d818ba518968480"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.10/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "111840b19d13ba2a4900b58bc48f81de57fb19731953390eaed483230b7ab6f3"
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
