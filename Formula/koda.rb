class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.7.13"
  license "MIT"

  # Apple Silicon only since 0.7.1: on an Intel Mac, Homebrew says
  # the formula needs ARM64; `cargo install koda-cli --locked` works.
  on_macos do
    depends_on arch: :arm64
    url "https://github.com/lijunzh/koda/releases/download/v0.7.13/koda-aarch64-apple-darwin.tar.gz"
    sha256 "c512a4eb091c2e679a31a4e0dd3725c5188297a07aa6e0d4972ddedc8d652225"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.7.13/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "97b5ea643e5b5e1e08be984c6b3096fbbd5ee5f5dae22832b66a5f4d4cd1f402"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.7.13/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9f75fe3434544953224538b73f5eb67628e0898377a5c45faa6069688e40934c"
    end
  end

  def install
    bin.install "koda", "koda-logs"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
