class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.2.26"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.26/koda-aarch64-apple-darwin.tar.gz"
      sha256 "5541540137980b5100dc6a031a04198d7b2ba1453d796a953c516797bd7103fc"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.26/koda-x86_64-apple-darwin.tar.gz"
      sha256 "bd59b19a2a9638ebbf99175504e62c512011ed723b11cd9b5e6aacea60a226a2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.26/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2219702971e5a94e9a8326651b1e8d6a22343715dd017203e7d82ec3e6add7d9"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.26/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "633b755786785dc9f49d827e66af9a98ff63fa3f83cb545ed12ac09a19f9d95d"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
