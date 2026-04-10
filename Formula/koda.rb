class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.2.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.6/koda-aarch64-apple-darwin.tar.gz"
      sha256 "2dd37fa860f33c650da457b7f55b9c00c4be87e6a5f70489b7bb0d14d7799105"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.6/koda-x86_64-apple-darwin.tar.gz"
      sha256 "fd7fa14f1ddec287251f8eeb984996f96a32b3300a08a2292409b8d5709cf3da"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.6/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ab5cb572b935b468ab7b2ac0b42e968787c32cddb1336980dd533cfc74c5c9d7"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.6/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0e7ad8176ba716924e70255556c771da51cbb9256dca2e1ed395f545f589651b"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
