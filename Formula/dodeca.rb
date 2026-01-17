class Dodeca < Formula
  desc "A fully incremental static site generator"
  homepage "https://github.com/bearcove/dodeca"
  version "0.8.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/bearcove/dodeca/releases/download/v0.8.0/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "7ab566ac192745315e917715586e093f84144d5c1cb9c9cbdc58fe71c11c4d77"
    end
    on_intel do
      url "https://github.com/bearcove/dodeca/releases/download/v0.8.0/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "7ab566ac192745315e917715586e093f84144d5c1cb9c9cbdc58fe71c11c4d77"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bearcove/dodeca/releases/download/v0.8.0/dodeca-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "a6fc2a8b2d1913ee6018f80cfbd007f8abc5e2106e5490d30bf04d75d70dca35"
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
