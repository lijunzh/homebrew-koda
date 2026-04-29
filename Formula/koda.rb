class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.2.23"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.23/koda-aarch64-apple-darwin.tar.gz"
      sha256 "e59439a1bce9045e33429712de53915539783a069c664988a2ebeb8cd13b74c3"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.23/koda-x86_64-apple-darwin.tar.gz"
      sha256 "9778d21de2b6e73594154f941182672f555b4c1626825eb32d2035bf943aad29"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.23/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e63a98c4694915f633bbdc48ac4085f5553a89bd0d02ee33044cb057a6bfd0d5"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.23/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fcd10502a8e579319d6ca1556993f32b013d04be8ef1c6cff774b7a87effcb56"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
