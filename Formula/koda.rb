class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.6.0/koda-aarch64-apple-darwin.tar.gz"
      sha256 "541284a44cbf298de05468524b38bd28848aac4a29a8617a3134fab92ae799e1"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.6.0/koda-x86_64-apple-darwin.tar.gz"
      sha256 "0b19e3dd4cddd0b8af36e53298d7b2489367418e8274f76b90f503dafd7ab084"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.6.0/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9f93ad13a4c58b4a76facaba7323cbb8f40bc4b454ee94c864a376ef015235e1"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.6.0/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "84f892f8ada31eaec1c37297ca0f56655cc06cc5dac6bef63379934ba8c61613"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
