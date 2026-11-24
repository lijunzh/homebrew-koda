class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.7.11"
  license "MIT"

  # Apple Silicon only since 0.7.1: on an Intel Mac, Homebrew says
  # the formula needs ARM64; `cargo install koda-cli --locked` works.
  on_macos do
    depends_on arch: :arm64
    url "https://github.com/lijunzh/koda/releases/download/v0.7.11/koda-aarch64-apple-darwin.tar.gz"
    sha256 "58a2d8ad9bccbdb072fb152ea82fd262206fcf5bbd6fb3f569730d09a5ab7673"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.7.11/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a6ce984c5e30cbeafbc99b74a6c211dc71c4bc73d48048e5b3ee873da920bb0e"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.7.11/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "124774744804e4bca791ef7371f64374be5a085f1b0b7a4084cbf20fe3fd73bf"
    end
  end

  def install
    bin.install "koda", "koda-logs"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
