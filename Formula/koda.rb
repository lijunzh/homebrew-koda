class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.2.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.8/koda-aarch64-apple-darwin.tar.gz"
      sha256 "8850d6573e749d41e6fc7549aaa9b985164efe201f7b473daca08f84ed621292"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.8/koda-x86_64-apple-darwin.tar.gz"
      sha256 "6dbbb2c8e750bd5ac3943ec81539ad241ed4eaf00aed5155106aece30d2ece76"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.8/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "778f86fe63d3f30e1e817674876dcdd258de406a317489767c381fcd06da848e"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.8/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0faab6d44da0a80afb67c05d0be3d3becaee646ce1732dbe4d1ce80780c2d210"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
