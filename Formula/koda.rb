class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.1.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.6/koda-aarch64-apple-darwin.tar.gz"
      sha256 "4c3c2361d4313d1f57b326dcb45ef649081fdbabbe3df854116cd11574fe67f9"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.6/koda-x86_64-apple-darwin.tar.gz"
      sha256 "09e496603afb2125fc2dab581e808ef052ffda9665597d4aba641488c2fb156b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.6/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2a78bc03fb5136477a26495e1f5f213dfccd397d428a5b9bfb3177d6a452a0a0"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.6/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4789eacddb349fcd973d7b452f1e2eb3531ee7bdfa55696649c41dabf32acb93"
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
