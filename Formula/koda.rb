class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.1.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.20/koda-aarch64-apple-darwin.tar.gz"
      sha256 "9f26103776a70cf7172c5523697e8b3a58c1e64c7e0165db4acc46b639e0233d"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.20/koda-x86_64-apple-darwin.tar.gz"
      sha256 "0f26c7771c2b21eaacc99fdf17a42ee9c3ffe65610c70c0891874d8b155c27af"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.20/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a6628a9e8f483b03b5b2ad62205dc2e01b2eeaa94375353fbe45bc9d0c7ce371"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.20/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "07657b10f4565fac0f5f8af3281c1c395e0fa4d629c4222ccaae7eb04fb9c002"
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
