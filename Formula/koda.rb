class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.3/koda-aarch64-apple-darwin.tar.gz"
      sha256 "1607290a77640004c2c520d5664d523eb58bdaa49daeba5426f238213d5a997d"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.3/koda-x86_64-apple-darwin.tar.gz"
      sha256 "2025de5ab94c843ef9f012225bfae10c5199d9fbe39b71466a2d3b066b6c1ce8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.3/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3581e61d5de43f1287fd7cbfaadba9f73a88a157174894e0f8e560aa1d4ff88c"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.3/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ebd06d523e56fc461b48ef3f2bb9245492feb26de0566b2a2301101f628be930"
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
