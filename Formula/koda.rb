class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.2.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.20/koda-aarch64-apple-darwin.tar.gz"
      sha256 "15f898a9ae999ed6592b6b9518a1c9cbd42a73ea094cbd83c34bee08eb038263"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.20/koda-x86_64-apple-darwin.tar.gz"
      sha256 "7f5407d1400886d1a69b9a7c7468e0b86df76c05d75f4c266c772334526ebcd4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.20/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "866ae63703b9332e585db44ebc9d697366e6422c720e06fcf4ebe6cee5d0faee"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.20/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9c699a42ea43d30cb95344f4ee5e7eee7da7431d87206efa0c718e54d085e6e4"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
