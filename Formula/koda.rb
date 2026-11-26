class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.7.14"
  license "MIT"

  # Apple Silicon only since 0.7.1: on an Intel Mac, Homebrew says
  # the formula needs ARM64; `cargo install koda-cli --locked` works.
  on_macos do
    depends_on arch: :arm64
    url "https://github.com/lijunzh/koda/releases/download/v0.7.14/koda-aarch64-apple-darwin.tar.gz"
    sha256 "90f3a666421c09376d98555ca68b8990301d0cbd7ffe11ba1a307e71461d2188"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.7.14/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c12d745862b5982628a805161e247be95c81b0d48fb94e22b9252e7241d795fa"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.7.14/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c3ea757c4f5e420d86f67f36b8f2496b7f866b2d79c8de4436630dda2dc65285"
    end
  end

  def install
    bin.install "koda", "koda-logs"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
