class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.1/koda-aarch64-apple-darwin.tar.gz"
      sha256 "13e10973c92ff1e9bf5a0ff95949afb82214544414bbb868e4efcf7b069f4261"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.1/koda-x86_64-apple-darwin.tar.gz"
      sha256 "56b6b52f964bbcdd54a686b1e8666b6ed6fb05f5c63a48e9a19bd4dfa2cf1cfe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.1/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8362321b32b693199440150049116aa08f5908a87ab1836140acdfb35eab96cf"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.1/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5f62ca6a40c0a71051bb5bd5c4d122068d5d829625a7cbdbc342a1d6900069b3"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda-agent", shell_output("#{bin}/koda --version")
  end
end
