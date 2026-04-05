class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.1/koda-aarch64-apple-darwin.tar.gz"
      sha256 "7c158a60b75d901e43e1ac711232241fedc5ba239de6fd91d35a5bd121836312"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.1/koda-x86_64-apple-darwin.tar.gz"
      sha256 "e99e20e4ccc189643227306f4155c3d205dbaef1347aa5c9c4cc9f3a1b03f796"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.1/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "26f152db652e51c5372a629dad5d07a65d14948da2017c8d42673cf38b6d8934"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.1/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "07c7096881859cbdcc9e0ac0db8d8377cd47835c8602ffcb6de6b00d250884f4"
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
