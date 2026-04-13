class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.2.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.12/koda-aarch64-apple-darwin.tar.gz"
      sha256 "6e6000611bdcc3390f477f70cad3489e5f6e85d0f8d76dcc086cb5a05b3949bc"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.12/koda-x86_64-apple-darwin.tar.gz"
      sha256 "d1b78030caaaf2b188075289391f084c239a6d025286717f196f7008bff01ab7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.12/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5e9ecb2cb8fecf3856d3b7a16a891fbce4d3ef3156435dce06a614ebd1458c03"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.12/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0ef68edc4af33c1a5f65d0d70609a7115e183a5ad702d508b08c2ff9d532abcd"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
