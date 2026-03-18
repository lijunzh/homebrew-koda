class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.1.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.14/koda-aarch64-apple-darwin.tar.gz"
      sha256 "bd65c929d118dbc44590a451cd79788ee8c90e39f400bce5eedf111cf60fbed4"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.14/koda-x86_64-apple-darwin.tar.gz"
      sha256 "aee7c22256cb8fd0090755df2a3da931011f91155a7dc6218a47a35cf9eef582"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.1.14/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4dca35d324ed3a320d34af4cf0738dd1e6bda14d8e284d6be9bcefd80b5df528"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.1.14/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b065a9d028968eb58f886f6bdd2b4251090c88e0b7c933ceae4858889060b722"
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
