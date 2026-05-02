class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.2.27"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.27/koda-aarch64-apple-darwin.tar.gz"
      sha256 "7b19c103654bb1db711c7ebe6160ab59123b0098647ced2db715cb4891690d31"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.27/koda-x86_64-apple-darwin.tar.gz"
      sha256 "f553a531a021de234993a20fd059b144c69b1386103c0d9413efd6846d811ff4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.27/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c0cf2095e495daf09b72a2c25d120ac2aba49e43c6b5848b68a56cecc5ca9d0f"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.27/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e0bf47858cd3af89456842048366587abed58eb9a82602fccc505b2b1127a1e"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
