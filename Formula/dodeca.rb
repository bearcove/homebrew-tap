class Dodeca < Formula
  desc "A fully incremental static site generator"
  homepage "https://github.com/bearcove/dodeca"
  version "0.11.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/bearcove/dodeca/releases/download/v0.11.0/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "e65ca3ee03075aa43bc188681a01aa07b26b69e4ea906aba8d1f31bfb736ff6d"
    end
    on_intel do
      url "https://github.com/bearcove/dodeca/releases/download/v0.11.0/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "e65ca3ee03075aa43bc188681a01aa07b26b69e4ea906aba8d1f31bfb736ff6d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bearcove/dodeca/releases/download/v0.11.0/dodeca-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "745d5869ccbf440c643381174e8c4e7bb3cf4d9d904e343c2bcf803fe3bfc785"
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
