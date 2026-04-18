class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.2.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.14/koda-aarch64-apple-darwin.tar.gz"
      sha256 "f4045e9b1b7a7ec3f1cf3918e58b036ab88cee84143d1059556106a964f89cb2"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.14/koda-x86_64-apple-darwin.tar.gz"
      sha256 "d44f631d85f776826f4c84e6660cba613ab3d90b0a617e5759bd5234d5d30abd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.14/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1d419da68effc1b5589196b92d220282085b9b103d86c3e7616c90add5f9fee4"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.14/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4f344f4c90de558ae6974ddd59867fed703c7fefc3fe75e987ecb4f6be7bba4d"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
