class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.3/koda-aarch64-apple-darwin.tar.gz"
      sha256 "aa2a7cb1e4afee23ef4aee8569666ad8731ffef4712fec4dfee51568446d66e3"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.3/koda-x86_64-apple-darwin.tar.gz"
      sha256 "351426686195b7fdd3b0766e69e2d5a5bd6d7ca612513968249bec8b55a4f799"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.3/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7f387f39168b23e4b83402e90eb3a6c8ee67b7c23412b163c6bea670523c43dc"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.3/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "087cb964ad9bbd0d3f1a2b4004d116106b3274efa5c89393727fd16658334988"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda-agent", shell_output("#{bin}/koda --version")
  end
end
