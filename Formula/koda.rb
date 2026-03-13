class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.1.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.9/koda-aarch64-apple-darwin.tar.gz"
      sha256 "98e0f0aa77095716fcd39cbc256cc04a2c021d493af0ac42a0db6a5263ff118a"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.9/koda-x86_64-apple-darwin.tar.gz"
      sha256 "3b7e9717c9999dc1f5b751c6fc2f8c08693a9bf650f65f63790c8286a5c39e45"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.9/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3936e7ef36c2c1a2afcef825bba22c3bb670e43faf0f6204a9fa5fa411381f77"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.9/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b5ae8e7e6a872bf94b042124bbe8cfa55c0f961ad426a5ef0e4374cf263ef273"
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
