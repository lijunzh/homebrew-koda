class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.1.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.17/koda-aarch64-apple-darwin.tar.gz"
      sha256 "a1803fd84f17fe8ebce7109cea4f1b9b700857dabd8d73a8254b32a84b0d291d"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.17/koda-x86_64-apple-darwin.tar.gz"
      sha256 "788876892ed2bb869dcdb8ec811b274bbe6a5393a96c5631f599a8261782cb0d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.17/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "19d1be0ae024e04aaabbfb79c1bdcf4149dc505f109ac28e1c08226d42ed145c"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.17/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3694174de2331c15f3b9c475a62dddd41a2fa8b6ee55cc9828b7a998819b35dc"
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
