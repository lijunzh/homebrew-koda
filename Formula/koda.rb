class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.7.3"
  license "MIT"

  # Apple Silicon only since 0.7.1: on an Intel Mac, Homebrew says
  # the formula needs ARM64; `cargo install koda-cli --locked` works.
  on_macos do
    depends_on arch: :arm64
    url "https://github.com/lijunzh/koda/releases/download/v0.7.3/koda-aarch64-apple-darwin.tar.gz"
    sha256 "86fe2f90b3a7c971d9402763006abba9dac628f16f35a3a3fee75e8c7b32b7dd"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.7.3/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "34b9019e42249d85c31b787572f3edf84ac96413c5da8571bd06b3106d0f86f4"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.7.3/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3128ce755e41c723bb5d63011f280720a69235a0940a5841af020e6e743aa9ce"
    end
  end

  def install
    bin.install "koda", "koda-logs"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
