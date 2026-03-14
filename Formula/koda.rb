class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.1.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.10/koda-aarch64-apple-darwin.tar.gz"
      sha256 "f6de5e580ee715665cb0a231688bf8f8ebde60c52268f3ee8dcfd1cf54fd7af7"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.10/koda-x86_64-apple-darwin.tar.gz"
      sha256 "869c113383ed8ca8f592fc501ad40f8fe12aec745701ad1ff1bb8fdc184dfbbb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.10/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "70a99d6205108b24b758d162e0360699995ab50ca65ecfdc9e294343b14447bc"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.10/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "20b816bcfe1a44ef8abf23faa95bea5b865d2dde4ec0019e49d788ee9f8901e4"
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
