class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.2/koda-aarch64-apple-darwin.tar.gz"
      sha256 "e9125c7f52b95e327144281ac11cf1a23423ae3c3ce896a151b93f55a0fad9d4"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.2/koda-x86_64-apple-darwin.tar.gz"
      sha256 "0c4435b490f2d0b76cd06bb5f0cf321620bc8727188235a2e43d9b954e513026"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.2/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f24c3d74306423b9d4701c8fa964968d762eb9bd71b3a81c244b25f49e5ac065"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.2/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0a4ae10c0744c970089125a25f8c7fd15e198836c231ed002a9629099a2d55b6"
    end
  end

  def install
    bin.install "koda"
    bin.install "koda-ast"
    bin.install "koda-email"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
    assert_match "koda-ast", shell_output("#{bin}/koda-ast --version 2>&1", 1)
  end
end
