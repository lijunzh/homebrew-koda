class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.7.7"
  license "MIT"

  # Apple Silicon only since 0.7.1: on an Intel Mac, Homebrew says
  # the formula needs ARM64; `cargo install koda-cli --locked` works.
  on_macos do
    depends_on arch: :arm64
    url "https://github.com/lijunzh/koda/releases/download/v0.7.7/koda-aarch64-apple-darwin.tar.gz"
    sha256 "136e64c65f030da0c364f9a4a9311ae2ca656d0b47d4c887952ae5b0154c2ac1"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.7.7/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d2d5c8b95bcdd54d0862a74ab479bf332e0e109fd651ea0282241edd1b6e5076"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.7.7/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ab45c8895f84abf65139fe4c3b544fece3bda3ce3d8c9e603a6adaee51419e37"
    end
  end

  def install
    bin.install "koda", "koda-logs"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
