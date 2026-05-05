class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.3.1/koda-aarch64-apple-darwin.tar.gz"
      sha256 "30e6a132236bf35ac93c9257b2367bbef50325e24b57ece8885998f937fee03f"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.3.1/koda-x86_64-apple-darwin.tar.gz"
      sha256 "d0a9a4559e63fd83bdc730d710dfefc8e953b6d8783df6bf3cc8d4a7b149d913"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.3.1/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "81351f672c149269f36bf34b736656a20c5bf0e99977ee26357b91835e14ee98"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.3.1/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3f2ec1277873321cf6d1f6d862f9be8bb5074e46df3cec1eff059632f70d47c3"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
