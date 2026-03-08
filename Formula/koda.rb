class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.3/koda-aarch64-apple-darwin.tar.gz"
      sha256 "59975a9593f21d1cd46695987e04b73e9e450186313b14fadc7b45d3c463c31e"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.3/koda-x86_64-apple-darwin.tar.gz"
      sha256 "e26471e9f03fbdf2cc77f4a2a66fbf84c6f72dd92a2b31ed4302805a466ab9d0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.3/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b17d55f2ca1034486feba7b2b975901190201bebd9b216337fe50ae6fb9c6fb0"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.3/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6b248b5d15b89ef87e17c2976b8a6d3b67a0cef7b82c773f32f75298820ad39e"
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
