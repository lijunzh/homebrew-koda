class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.1/koda-aarch64-apple-darwin.tar.gz"
      sha256 "58d6e54befe0be36f1cedced9614230583bf605811d2ce85b423d2a193b0c3c7"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.1/koda-x86_64-apple-darwin.tar.gz"
      sha256 "7ab439bfa0a9c92b2aacb1883201a489824fe6bf560f98da86de3f521990d6bb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.1/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ae24f7b3efbd590ab76cf0bda0e303a153d16104c770fdc7cf87ca61d4871c01"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.1/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "882f8c3df6b2b9b518a16381ba673eee1dacf467569e05288b8cc6d808acb42f"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
