class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.5.1/koda-aarch64-apple-darwin.tar.gz"
      sha256 "7b712661ad7ea33369cfda5d9fc67e8b9de9412a138e6479c3020295784a2543"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.5.1/koda-x86_64-apple-darwin.tar.gz"
      sha256 "a1ab2b05b14d78b3119ff45cb5e6180fc96ed9b226204637e6901aa5ec84cd4d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.5.1/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e37967887d703e16310256a121b80a0886e7916a3555083db778db8240852818"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.5.1/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "19441d56780042524a7444671265246a7ae737bf51226cf2b9f12d2e1ba471eb"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
