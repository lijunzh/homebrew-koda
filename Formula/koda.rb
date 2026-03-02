class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.1/koda-aarch64-apple-darwin.tar.gz"
      sha256 "97d263c526dda1679d0788cafe5bea905afd266e201dc4dae0c2f50e7594518e"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.1/koda-x86_64-apple-darwin.tar.gz"
      sha256 "a898d2e7ef463ec0fbc0035f3c8d8ff622a1911f547b23f9c8c04540598f5ea3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.1/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0595ed1343f4930a52271e7539d24540af005cc57cdb04a3b03e076691594546"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.1/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1f701cd1582e8cd20da5ee66108c24ff3267c4d97818cf2ff84dc95528ae5c2a"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda-agent", shell_output("#{bin}/koda --version")
  end
end
