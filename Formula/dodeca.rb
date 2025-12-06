class Dodeca < Formula
  desc "A fully incremental static site generator"
  homepage "https://github.com/bearcove/dodeca"
  version "0.3.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/bearcove/dodeca/releases/download/v0.3.0/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "4e5c14008598a1d7a9536ff78bef4cf788b4a62c76dadd96e5ee6c63f9cfa540"
    end
    on_intel do
      # Intel Mac not currently built - use ARM binary under Rosetta or build from source
      url "https://github.com/bearcove/dodeca/releases/download/v0.3.0/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "4e5c14008598a1d7a9536ff78bef4cf788b4a62c76dadd96e5ee6c63f9cfa540"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bearcove/dodeca/releases/download/v0.3.0/dodeca-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "1c57d3522cad85c4d6bcd909770b9df278bb20b11d84eb99641f8a21796d49a6"
    end
    on_intel do
      url "https://github.com/bearcove/dodeca/releases/download/v0.3.0/dodeca-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "73558621bf1a43f8e23281480ed846426082c1cc646519d37f9e207a13c83293"
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
