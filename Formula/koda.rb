class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.7.9"
  license "MIT"

  # Apple Silicon only since 0.7.1: on an Intel Mac, Homebrew says
  # the formula needs ARM64; `cargo install koda-cli --locked` works.
  on_macos do
    depends_on arch: :arm64
    url "https://github.com/lijunzh/koda/releases/download/v0.7.9/koda-aarch64-apple-darwin.tar.gz"
    sha256 "9f96b6f89151df39cc4a9bd03be5ead3d012a54bc8dfb59d9fb77690a65355fa"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.7.9/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2a9bd48e5d33fe52d59e9c081bc952d461dcb8f7db24d188bf760f3610754b71"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.7.9/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bbbf9951d5619264bb363a9903dec17bdfe4d31c6e928f2587ecb05d1eb3ecfb"
    end
  end

  def install
    bin.install "koda", "koda-logs"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
