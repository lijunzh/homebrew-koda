class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.6.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.6.3/koda-aarch64-apple-darwin.tar.gz"
      sha256 "8b69b59cf81828debef796fe8cc5efc12a408fb6c8c298fbbb43b139422f3d4e"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.6.3/koda-x86_64-apple-darwin.tar.gz"
      sha256 "addd5b15aa8bc60ed8747d108232f902d0504e96ec797820ff46f8b84e74f7f1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.6.3/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c81f9021bf93940684974486fa0e98518ca907e6cd8710f031c53f4c575d0015"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.6.3/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "18db961653e16b049fbc9785bada23a933e351aba0d1fb332a8990d9d0eaa9f4"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
