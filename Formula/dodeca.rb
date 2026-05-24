class Dodeca < Formula
  desc "A fully incremental static site generator"
  homepage "https://github.com/bearcove/dodeca"
  version "0.14.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/bearcove/dodeca/releases/download/v0.14.2/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "d607b676e9c77885428f104ba57aed9297f1fce6e6482fcf1f2b198a42a908fc"
    end
    on_intel do
      url "https://github.com/bearcove/dodeca/releases/download/v0.14.2/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "d607b676e9c77885428f104ba57aed9297f1fce6e6482fcf1f2b198a42a908fc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bearcove/dodeca/releases/download/v0.14.2/dodeca-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "16d34243a6285309b2d900e9b03ef95068fe8e1c80636ce9e1209435de2e8f92"
    end
  end

  def install
    bin.install "ddc"
    # Install plugins
    if File.directory?("plugins")
      (lib/"dodeca/plugins").install Dir["plugins/*"]
    end
  end

  test do
    system "#{bin}/ddc", "--version"
  end
end
