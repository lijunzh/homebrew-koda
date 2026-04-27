class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.2.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.21/koda-aarch64-apple-darwin.tar.gz"
      sha256 "569b8390079a6505ef378e1eb1daff774b16535db217b76e478f0b7cfb5049c0"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.21/koda-x86_64-apple-darwin.tar.gz"
      sha256 "f5817aa44888caf0ebc9bd6bb8e88c672b8039223b6a4c815a973819b974b212"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.21/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "404a275fefff15a3061f7953474927c9bbb461bba8d16f21aefec543fdb541de"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.21/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b66413b9234c52ba976756b7f1dfa247dd40d8b7d3c0dcae274f18caf26f8f46"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
