class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.2.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.15/koda-aarch64-apple-darwin.tar.gz"
      sha256 "222d3902a4f65e1767d287d2de3dbb987ebbc713b3ff1b12aae65dab4043b5e7"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.15/koda-x86_64-apple-darwin.tar.gz"
      sha256 "580a63a40203c2cac22b932f3a11a60392d9bd043b879c5c2c1e63d3e8546019"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.15/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "13bfca5942c7780b5cca1d7a8eff2d39c7f7a399b94c2309164ca3110cabdce4"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.15/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b87b19a5d03f6cd94d8aa9718e75791b4a5657af9f622f6481747ce997c3b9ac"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
