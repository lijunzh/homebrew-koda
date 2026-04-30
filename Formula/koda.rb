class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.2.25"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.25/koda-aarch64-apple-darwin.tar.gz"
      sha256 "b22a95a112fa4c2c9256383e450a4c38b60f6d9c545b84f57d1c559ba6e623d8"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.25/koda-x86_64-apple-darwin.tar.gz"
      sha256 "acbfd4d0ff8d8ee998a1e9e8eedeba30cdc8d362b5002782429559da0b86df11"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.25/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fc9b07288d2942ba8ec45fc7ddb087d61cc099f57e6d7d59b0e1cd1c2b972b82"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.25/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0603740ffaa64b1cf700419d07fb44b3e2b64ae7238570d2f7dcc05bc0848f0c"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
