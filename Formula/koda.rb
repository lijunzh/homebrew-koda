class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.2.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.11/koda-aarch64-apple-darwin.tar.gz"
      sha256 "8592d2a604dfcd8265c67ae83decb925dfabf7f7bf42811530eb087d7271ff4a"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.11/koda-x86_64-apple-darwin.tar.gz"
      sha256 "2ebcdd6378b051de4bfb8a393c3d8593608eaf749a95f0e0a3e517c9e69b4af2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.11/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2bf9294d2e19f91ed0a505c23dc13e9f8560a54eabc02b3e0106f6c478849842"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.11/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6118c08908ce76516047e5a7486175c2791bc99d139ba3a254504e25f251206f"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
