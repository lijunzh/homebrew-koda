class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.8.1"
  license "MIT"

  # Apple Silicon only since 0.7.1: on an Intel Mac, Homebrew says
  # the formula needs ARM64; `cargo install koda-cli --locked` works.
  on_macos do
    depends_on arch: :arm64
    url "https://github.com/lijunzh/koda/releases/download/v0.8.1/koda-aarch64-apple-darwin.tar.gz"
    sha256 "4a7dcc281affcee148fa4514c808f65561e5a060189746403023e5d2ce9adb57"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.8.1/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f3e6189e9182cc56b7e8716107f1878409a607a0c49a978d58436938fe83163e"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.8.1/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8f7d85d206c81115ca3a5fbfaac159365dc9ee54a7ca6743a939ee148ce9560a"
    end
  end

  def install
    bin.install "koda", "koda-logs"
    # The desktop app (Apple Silicon), zipped so Homebrew leaves
    # its signature alone; `koda app` unzips it into ~/Applications.
    (share/"koda").install "Koda.app.zip" if OS.mac? && File.exist?("Koda.app.zip")
  end

  def caveats
    return unless OS.mac?

    <<~EOS
      Open the desktop app with `koda app`: it puts Koda.app in
      ~/Applications, and updates it after each upgrade.
    EOS
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
