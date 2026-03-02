class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.1/koda-aarch64-apple-darwin.tar.gz"
      sha256 "2b4bd1581fd8a213e2aa62923f660bf168cfeb7b3518897c6b5c17110daa3f67"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.1/koda-x86_64-apple-darwin.tar.gz"
      sha256 "b8f2d5eb7684b19e490290de8740573c1129d148abf86d5fe126f9757a68b1fb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.1/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4686500e20d55777e0fa762454e2dd88803405e6462c843fee9ebb715b8538e0"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.1/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7d9d79bd7618fba53587a74d39fe77cdf93248bc8d1ec4304dc62a51bf7c7501"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda-agent", shell_output("#{bin}/koda --version")
  end
end
