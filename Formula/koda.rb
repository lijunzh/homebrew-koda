class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v#{version}/koda-aarch64-apple-darwin.tar.gz"
      sha256 "70aa539da2d12a426e24d6b642483eabe71e60976fdc70ccfd0b40e36d626e6f"
    else
      url "https://github.com/lijunzh/koda/releases/download/v#{version}/koda-x86_64-apple-darwin.tar.gz"
      sha256 "527032d1c70a4ebb7c05db9332a821003f9113c00d20aa3162d39507591fe37d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v#{version}/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f6162792ae3950019bdf75d04f74cb8c2e545cc7a13bd70db3cd57f53f60631c"
    else
      url "https://github.com/lijunzh/koda/releases/download/v#{version}/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d918aafe1509102192ad4a667acb697035bd013337720aca8c619aab55191c7d"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda-agent", shell_output("#{bin}/koda --version")
  end
end
