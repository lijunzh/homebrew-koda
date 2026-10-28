class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.4.0/koda-aarch64-apple-darwin.tar.gz"
      sha256 "8da5a2ed78f3ace84b0412cfd6d80c728e2fc5b4069ea7dcd67af6cbd6d49092"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.4.0/koda-x86_64-apple-darwin.tar.gz"
      sha256 "98ffe461c688544a6a1d4f3c743ff284cd590e5df432f8f74fa7997cfbae0581"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.4.0/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "12dfb4fb7090c81d619c6acef249e3c9a2c9862f1204cb7384a3050ca8014578"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.4.0/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5da7ea7beed1846cbf9dc6697cc963f977e91b6d32c7732a9057edda4ea8bc5b"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
