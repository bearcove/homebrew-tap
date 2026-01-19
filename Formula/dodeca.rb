class Dodeca < Formula
  desc "A fully incremental static site generator"
  homepage "https://github.com/bearcove/dodeca"
  version "0.9.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/bearcove/dodeca/releases/download/v0.9.1/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "8015a485f6bb633d67dfb46df23da2d35881e7f4b20d0e5434115de53e4087fb"
    end
    on_intel do
      url "https://github.com/bearcove/dodeca/releases/download/v0.9.1/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "8015a485f6bb633d67dfb46df23da2d35881e7f4b20d0e5434115de53e4087fb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bearcove/dodeca/releases/download/v0.9.1/dodeca-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "d4ebe9a3365697dc9c1701897db7a3dfee7c5d31120d2c9f6fa59eb4e61a9afb"
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
