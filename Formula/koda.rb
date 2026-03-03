class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.2/koda-aarch64-apple-darwin.tar.gz"
      sha256 "37167576ba6401c3f167b2616ed04d7d24374977f2d014cc1ea149dd8235b47a"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.2/koda-x86_64-apple-darwin.tar.gz"
      sha256 "6b38bb55da981fc0474dee4bc55f21a801f611834ca9317e882934a16804d49c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.2/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3d9fe68f785b79656ecc4df3614d097d1354bb5ab4978c7ade418d4fc117cb0f"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.2/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "eac02405ae556142642814ae02f7aed6ad9bac0f5e2529c88155e8f12e2428ee"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda-agent", shell_output("#{bin}/koda --version")
  end
end
