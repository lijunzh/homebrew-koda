class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.5.0/koda-aarch64-apple-darwin.tar.gz"
      sha256 "5491a9929141c2955bcba991a3452a2187995c4114dbee425e7ac70b2e1f835d"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.5.0/koda-x86_64-apple-darwin.tar.gz"
      sha256 "03170f571a2b70290f00638d8921793c852149354e651db39ed969172597c0c8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.5.0/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4c9429d11aea312a629f66f33281e2a03aebda9de51e85b4384809b30a3ea278"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.5.0/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fad16c58ba92c27c44ac49f2c3b09fe1c7b39d6d8bccbcf7513811a8be90b554"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
