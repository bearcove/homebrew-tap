class Dodeca < Formula
  desc "A fully incremental static site generator"
  homepage "https://github.com/bearcove/dodeca"
  version "0.17.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/bearcove/dodeca/releases/download/v0.17.0/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "0acf049de2eee4ffe38f4c91a1b6feb36a28c96a29fc7548f528abacefdc657e"
    end
    on_intel do
      url "https://github.com/bearcove/dodeca/releases/download/v0.17.0/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "0acf049de2eee4ffe38f4c91a1b6feb36a28c96a29fc7548f528abacefdc657e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bearcove/dodeca/releases/download/v0.17.0/dodeca-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "4c27f9689fe632752d947e1bd4a1cec3cad7a8760fe29e5b1132a4f402f0da24"
    end
  end

  def install
    bin.install "ddc"
  end

  test do
    system "#{bin}/ddc", "--version"
  end
end
