class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.7.8"
  license "MIT"

  # Apple Silicon only since 0.7.1: on an Intel Mac, Homebrew says
  # the formula needs ARM64; `cargo install koda-cli --locked` works.
  on_macos do
    depends_on arch: :arm64
    url "https://github.com/lijunzh/koda/releases/download/v0.7.8/koda-aarch64-apple-darwin.tar.gz"
    sha256 "dcccbf8d297eeb812a342b4f8b40debadd0b009de51c0e4bc6c16943202834cd"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.7.8/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a18013b423ce78612475a6757b97e68310a16805ac6dfa318d879db38afc8d41"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.7.8/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9f864ff1b737ba070538c96198298b400fee450140d2f1a7a1e97f24ec60f2f0"
    end
  end

  def install
    bin.install "koda", "koda-logs"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
