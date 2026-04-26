class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.2.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.18/koda-aarch64-apple-darwin.tar.gz"
      sha256 "760dc09fc02ae79fba7f3d83fe868f3c854a33aa34f86c76ba02bbe9cee3dbf6"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.18/koda-x86_64-apple-darwin.tar.gz"
      sha256 "93c9efd928f3fb183f5590a786489f9af23883884be442c89f2e07d56358dc09"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.18/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d236c2291a3546802aea26d505fc3745e24c3bb2a6349bd1de66574afc7b8b7a"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.18/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4a90778013412190a32a4a94b45cde6d5c15dec0ee0302ecfb1194fd971e524d"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
