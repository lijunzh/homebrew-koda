class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.7.1"
  license "MIT"

  # Apple Silicon only since 0.7.1: on an Intel Mac, Homebrew says
  # the formula needs ARM64; `cargo install koda-cli --locked` works.
  on_macos do
    depends_on arch: :arm64
    url "https://github.com/lijunzh/koda/releases/download/v0.7.1/koda-aarch64-apple-darwin.tar.gz"
    sha256 "6ef6c6f403eb5911f9a081d7899c03b2feecd525012b3cff419051cea32b29f9"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.7.1/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "832e59ff97b357fdb94e05a1d15a37a9973d14522587e4e93911c133b3f2a539"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.7.1/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "35153ba0c3e60d331446d6954060ab8530643af904158716958e051d0c6132ad"
    end
  end

  def install
    bin.install "koda", "koda-logs"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
