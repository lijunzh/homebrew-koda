class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.8.2"
  license "MIT"

  # Apple Silicon only since 0.7.1: on an Intel Mac, Homebrew says
  # the formula needs ARM64; `cargo install koda-cli --locked` works.
  on_macos do
    depends_on arch: :arm64
    url "https://github.com/lijunzh/koda/releases/download/v0.8.2/koda-aarch64-apple-darwin.tar.gz"
    sha256 "09fd48343e9223f970922d330602c7c69c676be12c0f75c868c4c69ec0bf6f36"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.8.2/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ffd50cae55f19d75e946f07d4dd513c5d70983b0979e6b2d01757c70a98552cf"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.8.2/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8c9342eb1e615224048f4adff9d67d5b9eb72a46c09688374b0a946f4b0ab5c7"
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
