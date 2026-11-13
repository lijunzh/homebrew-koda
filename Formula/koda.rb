class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.6.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.6.4/koda-aarch64-apple-darwin.tar.gz"
      sha256 "b2355f86e82228ffb521f47eac86fb899014aaa7b87390b379a3d85843a5367a"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.6.4/koda-x86_64-apple-darwin.tar.gz"
      sha256 "cb127fbf0ce764e6134b739bbb938c418e3e912198677bdd872e2d93a4f28fa0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.6.4/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "797e01bcf549703eb64045280e44158e757b82d3b78df8143c1529df56897674"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.6.4/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "66c4cf27b044cfa9ef296fb03dfcc4e267ceffa8580af01c7fc49573d1765563"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
