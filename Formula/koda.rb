class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.7.4"
  license "MIT"

  # Apple Silicon only since 0.7.1: on an Intel Mac, Homebrew says
  # the formula needs ARM64; `cargo install koda-cli --locked` works.
  on_macos do
    depends_on arch: :arm64
    url "https://github.com/lijunzh/koda/releases/download/v0.7.4/koda-aarch64-apple-darwin.tar.gz"
    sha256 "a36e8453d13aaaa5bfc76343175a0e3fd3d4d0d5f8fca7a8134d53026db58906"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.7.4/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1bf167883fd1b376e4a48d5cf27e1f96cd9d5212fe22151e525b4b25c474efd5"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.7.4/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "698385a5406945cb442072bb149aa14f5377cc348c4e3ed01295e6189df75009"
    end
  end

  def install
    bin.install "koda", "koda-logs"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
