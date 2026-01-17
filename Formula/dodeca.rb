class Dodeca < Formula
  desc "A fully incremental static site generator"
  homepage "https://github.com/bearcove/dodeca"
  version "0.7.4"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/bearcove/dodeca/releases/download/v0.7.4/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "bdffbd729654cc16f8a7e5aede1477899d857e06b17cb56c1d8a64234ab47377"
    end
    on_intel do
      url "https://github.com/bearcove/dodeca/releases/download/v0.7.4/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "bdffbd729654cc16f8a7e5aede1477899d857e06b17cb56c1d8a64234ab47377"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bearcove/dodeca/releases/download/v0.7.4/dodeca-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "5f8ec7ee3a2a73af6097d3d835ec9ab8b95af9f6ca11102aea90a397b857a25f"
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
