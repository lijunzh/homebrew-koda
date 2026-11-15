class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.7.0/koda-aarch64-apple-darwin.tar.gz"
      sha256 "939b0b7a1c60a092e43eba6d5af1e6c9f048ef9b3ad2e93b28feea90b2a67ba8"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.7.0/koda-x86_64-apple-darwin.tar.gz"
      sha256 "9696ad8a8032d14721c1e26af76823520914ef8f7931a376787f7a43069ca847"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.7.0/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b24f155f5eaca385a0ced8e48cbf953081f36ad5a31c4577c3ea56854b798cd2"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.7.0/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bdcf15740ed6599dde605660f6abf8b6d42079cf8e628f5b0a1e6e624c8015e9"
    end
  end

  def install
    bin.install "koda", "koda-logs"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
