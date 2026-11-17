class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.7.6"
  license "MIT"

  # Apple Silicon only since 0.7.1: on an Intel Mac, Homebrew says
  # the formula needs ARM64; `cargo install koda-cli --locked` works.
  on_macos do
    depends_on arch: :arm64
    url "https://github.com/lijunzh/koda/releases/download/v0.7.6/koda-aarch64-apple-darwin.tar.gz"
    sha256 "818a3dea3a5fcda47ae874951a047167b7ad48ab043c1ab2be2ca45ea6151c16"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.7.6/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d19792f057dced4a78784e121047cffddbf6f54236ee920b7c7d98f5ba275996"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.7.6/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "00273524cbde2c70f5110199c277ec461451f30620922cec1f20011279185002"
    end
  end

  def install
    bin.install "koda", "koda-logs"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
