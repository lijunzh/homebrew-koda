class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.3.2/koda-aarch64-apple-darwin.tar.gz"
      sha256 "f885d4f471229cf9a8b6148e3328ff891748d19b742669e549e4213a0937970b"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.3.2/koda-x86_64-apple-darwin.tar.gz"
      sha256 "1015cb3ec20044d1c1fde6df99a43975eabbecdfb6b0c0c55399e73162d7b6b8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.3.2/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "429f776004dd485987cd865d333bccca8d4364f5159e2da2dde7eebab9a84cdf"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.3.2/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "55e002b969f2dd3d2b825f936a62a773238ea4d22751a9342a2f42d3f20308b8"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
