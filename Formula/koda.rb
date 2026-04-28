class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.2.22"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.22/koda-aarch64-apple-darwin.tar.gz"
      sha256 "5d44db7cff1ebc9ff54042165bc1906a9adfb48efcbcc0a2bc1ea1d15af3c979"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.22/koda-x86_64-apple-darwin.tar.gz"
      sha256 "a313298f49e60fd6ae655d15d26a8e15eba05e28c8560cabf92d7bdae0c81c3a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.22/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "44cb6a73e4764bf9c158f6096718ef5f22bd1206530e5ab54f6c7501165d7748"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.22/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4a6cec8368b7329d1a1208eb954292e12a4a05429e74ed50b6d087bb09bd7489"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
