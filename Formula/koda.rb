class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.7.2"
  license "MIT"

  # Apple Silicon only since 0.7.1: on an Intel Mac, Homebrew says
  # the formula needs ARM64; `cargo install koda-cli --locked` works.
  on_macos do
    depends_on arch: :arm64
    url "https://github.com/lijunzh/koda/releases/download/v0.7.2/koda-aarch64-apple-darwin.tar.gz"
    sha256 "9ebfc5d9231766b1e3cc4765e85234bfe8d3aef6b1ad5d0b69c592c4441f380f"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.7.2/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c362e416681ba5e8486467235c03fdd34a59ba053139867da59ab5ae9ace8265"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.7.2/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3857e5d0238813eac41ba3437e82e2d14ce31fc4f2dbc7c205cc2ffa57762fb2"
    end
  end

  def install
    bin.install "koda", "koda-logs"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
