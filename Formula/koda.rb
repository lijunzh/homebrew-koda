class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.7.5"
  license "MIT"

  # Apple Silicon only since 0.7.1: on an Intel Mac, Homebrew says
  # the formula needs ARM64; `cargo install koda-cli --locked` works.
  on_macos do
    depends_on arch: :arm64
    url "https://github.com/lijunzh/koda/releases/download/v0.7.5/koda-aarch64-apple-darwin.tar.gz"
    sha256 "b19c14aa5442e76c56099185f5a07a3b979eb092b039e3c1e6c58ae70c3a356e"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.7.5/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "83409a5aa993f00b663c9b2823a0be95775222ee28bb9d3b9de72a92a1c5e4f6"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.7.5/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f8e760e39e424f248c0bfcdf998705fe5312f6d122b6c4377cdc977d53a49015"
    end
  end

  def install
    bin.install "koda", "koda-logs"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
