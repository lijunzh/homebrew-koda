class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.5/koda-aarch64-apple-darwin.tar.gz"
      sha256 "4424cd95909df02805b2f8b9afcc5a6826c764aae713e44bccddcd417e8cfb54"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.5/koda-x86_64-apple-darwin.tar.gz"
      sha256 "64efa3f3ba196cf16d71ee27a5624c1db0e2bcdecd8ce02eb10a3a3c97ce9b9c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.5/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "48ac98dc241e2da55f7d920c8cda70d7de72bc1eb92ee9d3c9e0bd455ea9f6df"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.5/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e8df677a627ccea7ae9bd387969c086e9f634b3e2b377d7d70304092d1307c2d"
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
