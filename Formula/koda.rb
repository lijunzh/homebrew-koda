class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.4/koda-aarch64-apple-darwin.tar.gz"
      sha256 "7db2f838299ccbcf19862b38b56f32fec669faf665289a355b34523477d223b8"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.4/koda-x86_64-apple-darwin.tar.gz"
      sha256 "3f215301f83fd078aa40c01db70934646829689b4a80e691894a1ac47b837659"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.4/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "94b0a46d0f75bcb3710a516b88cc7cfc359229a267f25b3350c82b8e7b738538"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.4/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "235ebd1317f1006e8fbe20088ba685611558e36dab927c7cb2a860b2ddd5822a"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda-agent", shell_output("#{bin}/koda --version")
  end
end
