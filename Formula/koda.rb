class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.1.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.16/koda-aarch64-apple-darwin.tar.gz"
      sha256 "ea0c30e416a40f0c8d2224087ef052d5183b7a1c531ddf2a8a1cce70f9224bb1"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.16/koda-x86_64-apple-darwin.tar.gz"
      sha256 "86ebb7d610365a196a521b0d4f8a988065f37d4d802fe44d6e84e9791315d495"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.16/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3ad0e0caec00123ef96516833a3ee555d4ecac475d12c0e6a53d9489520ca616"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.16/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3f30e27cc737a759896371d26156758a629485dc91afd1373395bf17c63b4b86"
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
