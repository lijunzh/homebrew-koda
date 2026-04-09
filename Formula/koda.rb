class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.2.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.5/koda-aarch64-apple-darwin.tar.gz"
      sha256 "faacd5ce27038fa28aad391dddd11e7c17bd1ca6db6eeec2ea4813da3191494a"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.5/koda-x86_64-apple-darwin.tar.gz"
      sha256 "79c3eda78b11f6800b1e5bf241c0c6ddf467c8bf9d4a52b204d22531c1b508a0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.5/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "53a998e1bda57fbf7504a0eb8b43e27da3d4f60e7313a6e6699ad8efb33ea6e1"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.5/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a4be15e6f2a5a82703880be46f30d24b74dcf7684fd2d232d6b7109f0499f051"
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
