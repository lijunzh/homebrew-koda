class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.6.1/koda-aarch64-apple-darwin.tar.gz"
      sha256 "a9e84397090854ab9e4f9d7731fb52a1617238e7399e526c7f2a362f9c7dfb69"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.6.1/koda-x86_64-apple-darwin.tar.gz"
      sha256 "aeeacc641b592224c1b62da2f805bb27388c22ddfb4f06c01f14c4b9e7722b7f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.6.1/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c2f08780e9db83173fffbdddeae05e02c97b584e5944792c3d6cea7dd562a2f4"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.6.1/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3633192f6155e28ab1f09c9d273a923b9237da5da01b61b131f80a1880594905"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
