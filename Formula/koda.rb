class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.8.0"
  license "MIT"

  # Apple Silicon only since 0.7.1: on an Intel Mac, Homebrew says
  # the formula needs ARM64; `cargo install koda-cli --locked` works.
  on_macos do
    depends_on arch: :arm64
    url "https://github.com/lijunzh/koda/releases/download/v0.8.0/koda-aarch64-apple-darwin.tar.gz"
    sha256 "fe9412a0defe0a61ee2c16bc12fbdb95c7676db02223af0e596c8fb5731d5a25"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.8.0/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "172879199312665c9e3d0da68542d7e1e78e0c804f0eb38405c8f8d3251a3c11"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.8.0/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c4fc1b7279cd0838037578d4f6b37256980695bac8a2b213e6b8063455621cc7"
    end
  end

  def install
    bin.install "koda", "koda-logs"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
