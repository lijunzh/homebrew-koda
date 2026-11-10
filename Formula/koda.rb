class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.6.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.6.2/koda-aarch64-apple-darwin.tar.gz"
      sha256 "efa13f87f2b44031add64eff2ad36ee0646a4c07c9745825438411ad58d4eef8"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.6.2/koda-x86_64-apple-darwin.tar.gz"
      sha256 "55abf76298270af6b0c78672f8d2e89d47990354966b7693dafcee6d541e0e1a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.6.2/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ed51e9a8af4b498c1648a1e327a015dd5a35eb957ad4daeef3d5a0855626fe63"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.6.2/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e76eb40237bf300acc17032c614b645bb0d180d6da9b7706604314b3998d9d83"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
