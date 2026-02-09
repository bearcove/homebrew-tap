class Dodeca < Formula
  desc "A fully incremental static site generator"
  homepage "https://github.com/bearcove/dodeca"
  version "0.13.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/bearcove/dodeca/releases/download/v0.13.0/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "14f54e7b961e482ce33a094845200e013d30e56dce3eb52d7982345c7a5d0b55"
    end
    on_intel do
      url "https://github.com/bearcove/dodeca/releases/download/v0.13.0/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "14f54e7b961e482ce33a094845200e013d30e56dce3eb52d7982345c7a5d0b55"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bearcove/dodeca/releases/download/v0.13.0/dodeca-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "97abd73ca2ebfea43874e00659909969fabf2ecbc08cbef85b91a7c6204ef316"
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
