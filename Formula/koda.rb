class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.2/koda-aarch64-apple-darwin.tar.gz"
      sha256 "d21b1eb3fd647b7a358bf61137feed52c2047d03230895de71968d941456cb7a"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.2/koda-x86_64-apple-darwin.tar.gz"
      sha256 "d3ee59b911005d5ff33f1b659e8b6d52dcf717a9fa4803f57814229af35dae6a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.2/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b43946694a19175d9e543cd336fdc914bd484a328088f9218ce0521610aa53fa"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.2/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "775a722a88721b57db49f6ae155ece679adb36c50ba22798def6545fd271f162"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
