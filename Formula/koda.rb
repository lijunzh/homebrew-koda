class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.7.12"
  license "MIT"

  # Apple Silicon only since 0.7.1: on an Intel Mac, Homebrew says
  # the formula needs ARM64; `cargo install koda-cli --locked` works.
  on_macos do
    depends_on arch: :arm64
    url "https://github.com/lijunzh/koda/releases/download/v0.7.12/koda-aarch64-apple-darwin.tar.gz"
    sha256 "5a44875d7cc358f23a7897d78a5b5b8beb51f5b70e8e918a243690f57fb61ef4"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.7.12/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f177b98ea591d8fc691b4447589b7ac30b667213b9ae50965cd49e5ff63ba3a2"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.7.12/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0c23e074fcfd53c29e0986929b1c41f8168d6b320e31bf7ae4502ebb1ca649dd"
    end
  end

  def install
    bin.install "koda", "koda-logs"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
