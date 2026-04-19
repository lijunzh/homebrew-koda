class Koda < Formula
  desc "High-performance AI coding agent built in Rust"
  homepage "https://github.com/lijunzh/koda"
  version "0.2.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.16/koda-aarch64-apple-darwin.tar.gz"
      sha256 "07e4418b5393f73bd984e012cdf9e601211e160e8e2a9e8a7cc20a2b22f3cde2"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.16/koda-x86_64-apple-darwin.tar.gz"
      sha256 "342bc669180ad721a7f04c2a8a061e26692e0d63a2c8e1fba3f8bbdebb706346"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/koda/releases/download/v0.2.16/koda-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "64d231b3893d796770bc0c4b4072cf268c28a047a32d73c86f6f48fb044238ac"
    else
      url "https://github.com/lijunzh/koda/releases/download/v0.2.16/koda-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "42076e67295c11acfbb282c1e163bc36f36e05f858573901e5c830d060cf9dd5"
    end
  end

  def install
    bin.install "koda"
  end

  test do
    assert_match "koda", shell_output("#{bin}/koda --version")
  end
end
