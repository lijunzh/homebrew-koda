class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.2.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.19/koda-aarch64-apple-darwin.tar.gz"
      sha256 "7725447f5e8f4f8d4d9d0b27d45594f9a69dda3998f52b2e1e47900593ed3e2b"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.19/koda-x86_64-apple-darwin.tar.gz"
      sha256 "1a9614f3b8750aebcb75bff24a35161920b05c57fcc435902c177b6dced1c9e1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.19/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2c9dddb062b18ac9d9a3ab15b0fc99f34a7f5a0df387375858e9eb49cead84f4"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.19/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0c5fd2dbdc3a4ef5738868e207727c2f15f508fa33a76e69745e399ca2939a2b"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
