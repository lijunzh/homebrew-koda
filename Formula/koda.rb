class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.0/koda-aarch64-apple-darwin.tar.gz"
      sha256 "2a82817f9b322a25df5c4795d8a703d2a5f9280b64d28016e19703b169cf2fb7"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.0/koda-x86_64-apple-darwin.tar.gz"
      sha256 "d87090039fb15337691898491c8a1aa77a697e94dfce6ac79e9fd02d49a2a97d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.0/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a7f9a48d0ba1f7e6f9db4971f2f189ad873c39656ef7b871d775ef708da63ba2"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.0/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "362dcc11de14050c38e38b916460bb2907e8290de6139bdf4292b2634c8c82f5"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
