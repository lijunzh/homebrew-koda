class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.7.10"
  license "MIT"

  # Apple Silicon only since 0.7.1: on an Intel Mac, Homebrew says
  # the formula needs ARM64; `cargo install koda-cli --locked` works.
  on_macos do
    depends_on arch: :arm64
    url "https://github.com/lijunzh/koda/releases/download/v0.7.10/koda-aarch64-apple-darwin.tar.gz"
    sha256 "aee9778256f67c1fc350ca034cff696d761af973b6f82fe37090e87f379b162c"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.7.10/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "48546ed862061fb97c93008564fd32d9208ba6ffad4c2e49cc3b417595bf19a4"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.7.10/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "76e1ab52d191b19dad2fbd3ca2fdb91e70e3c71eee76b0627feeb86ef9cd9d3d"
    end
  end

  def install
    bin.install "koda", "koda-logs"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
