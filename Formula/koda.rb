class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.2.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.7/koda-aarch64-apple-darwin.tar.gz"
      sha256 "cd75f2ca806fa6987a9534af3eca9baecece8d08031455ce8cc23cacf099fc85"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.7/koda-x86_64-apple-darwin.tar.gz"
      sha256 "de078a9b69987d3c2790a4df68186a950e06c6803d083172cb953e332dd110d2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.7/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "372e2e10731d6c62e6ed7793d1ce0b9677f5b708261be6e7347f36f99d3b37d5"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.7/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "59cbedf865b1b22918353f2844348853fb5f7a8330e5bbab71f096d217e0366f"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
