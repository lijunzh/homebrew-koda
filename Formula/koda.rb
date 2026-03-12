class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.1.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.7/koda-aarch64-apple-darwin.tar.gz"
      sha256 "013c4c2e6f8b270a4ae2f42c4324b5db0a1efcc52c9a6dc9f6fba1f0047bdaba"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.7/koda-x86_64-apple-darwin.tar.gz"
      sha256 "d6a578adab04c5e69f6729ca62910a2ec7014c62cab45c25cf9ef67144e95b77"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.7/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "54365e8f5420a7433d6275579f690047785cbabbc2f3feddb5db171eb5888738"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.7/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "02f63430f390a698cea15c7baba017b8879103b96ddd395deb8bfb777217bfa3"
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
