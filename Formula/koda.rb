class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.1.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.13/koda-aarch64-apple-darwin.tar.gz"
      sha256 "e94bfbadecd38cdb96abe5cdda0aff7e5aceec6b731b735c16a963c50974879f"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.13/koda-x86_64-apple-darwin.tar.gz"
      sha256 "4ac4f6870ff66917312a534d748e04dc3b24961ad3a5ecebfef80df88ff1e3b4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.13/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d9c337b8334f82d0992a880bfc0411a547b6e68b782a1c07a856a7d6b39c258a"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.13/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5a00c2f5fe03cfcad0924f1f9b5719e5cd833b102e6699f0875d5a966eced198"
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
