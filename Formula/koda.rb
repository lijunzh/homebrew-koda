class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.2.24"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.24/koda-aarch64-apple-darwin.tar.gz"
      sha256 "63908ec1f419f64bfb90ea8df1054370123142116f7d7bbde46fffb4ebe43c46"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.24/koda-x86_64-apple-darwin.tar.gz"
      sha256 "e126bfbb306335bdefd9f44a43cbd2a7006b15be30f376d18bf6e3a3c2b5e406"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.24/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3d1a53fe449802048f5c67203de577f970feb2aaba552f5793ed9091d67a4495"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.24/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "842864c17377f9c0bf6df837ba3111c01f689dc21391f05a1eaf7bb027066b17"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
