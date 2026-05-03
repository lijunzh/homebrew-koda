class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.3.0/koda-aarch64-apple-darwin.tar.gz"
      sha256 "89ce3d07d46c1c71ed8f21c56f2f7c146aa5d7a8554a7923315fc9f088506e56"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.3.0/koda-x86_64-apple-darwin.tar.gz"
      sha256 "8548c56ee3b43c46fb9e6ace1730d8122362dd6d24bdba21218867830103009d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.3.0/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "be86f1b9b6cf7faff10a09dce8e07d4c5633c0733ea30bd05165889be0175d1f"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.3.0/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ead4103a364b1182c48dc64fab5b9244e8411f2c4937153ba1ec47982bb1eb49"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
