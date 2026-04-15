class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.2.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.13/koda-aarch64-apple-darwin.tar.gz"
      sha256 "66ef7e23757584a7e607e0c2d1c6a8d6086bff2bfb53751d9ee93ffdfee1881c"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.13/koda-x86_64-apple-darwin.tar.gz"
      sha256 "3cc35fdc68503c38fc615f8ac40fc7927e206936f5b23495bda20dd91c428c9a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.13/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1e74c9df90d129f58dc7031d51d99dbc4e17e470d410eb3995b184ddff16cc7b"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.13/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fc9b2383c32dbdb4fa6f5c90a5f7cf61e3d12c07db529e2b8469a96ebd299f6c"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
