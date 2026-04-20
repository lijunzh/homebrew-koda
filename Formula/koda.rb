class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.2.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.17/koda-aarch64-apple-darwin.tar.gz"
      sha256 "6266e418f6688739d50c3cf082b6201cb2c6381b588ec15e343d03a9cd513857"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.17/koda-x86_64-apple-darwin.tar.gz"
      sha256 "c6edd8b759bb48593dbaa81251d9ed1b8d17f2dc0255115d4fc1532baf2ee5ad"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.17/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c54729b52d59de15ba33852791cc0851de43f79c9a42d3f5d97572c07ddff5bc"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.17/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7b675dadf8cce22c175bdebb29d1c68013be7d48f90e978931ceb6c3ca0af887"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
