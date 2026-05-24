class Dodeca < Formula
  desc "A fully incremental static site generator"
  homepage "https://github.com/bearcove/dodeca"
  version "0.14.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/bearcove/dodeca/releases/download/v0.14.0/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "b2a9ff834b15c626a32e5845c006ed82e29a9f7e9d07916a0b444d275382b70d"
    end
    on_intel do
      url "https://github.com/bearcove/dodeca/releases/download/v0.14.0/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "b2a9ff834b15c626a32e5845c006ed82e29a9f7e9d07916a0b444d275382b70d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bearcove/dodeca/releases/download/v0.14.0/dodeca-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "1a3696a1709f039455fc6c98525525652c15a389f10de688f6604d8a477f8425"
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
