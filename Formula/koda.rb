class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.2.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.9/koda-aarch64-apple-darwin.tar.gz"
      sha256 "dfa163f2c7c7b50cb1719284ade66102658f52fca2bc98c3df7bd6d518492d85"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.9/koda-x86_64-apple-darwin.tar.gz"
      sha256 "b2d102e65259374954e89cbc4e4a68de861f1e294685383fbb4ee87ae6d2f4f1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.9/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "81f9bbb5a212749266de7db85011da5609c7e2e062e4f3203ee5871b743b8134"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.9/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "07004235aea35af2c5317ad8568f40f104904206d247d0e6ea8ab43fd3a9b7c3"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
