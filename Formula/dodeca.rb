class Dodeca < Formula
  desc "A fully incremental static site generator"
  homepage "https://github.com/bearcove/dodeca"
  version "0.4.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/bearcove/dodeca/releases/download/v0.4.0/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "41083e7d1623703a7c1ec2af238ce94dd5f19b0628d774d09cd845db25734848"
    end
    on_intel do
      # Intel Mac not currently built - use ARM binary under Rosetta or build from source
      url "https://github.com/bearcove/dodeca/releases/download/v0.4.0/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "41083e7d1623703a7c1ec2af238ce94dd5f19b0628d774d09cd845db25734848"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bearcove/dodeca/releases/download/v0.4.0/dodeca-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "269d7ab61f3c9cc80ed557af3be43db6bae7ccae5d6a2f8a200d2483b3b2a0be"
    end
    on_intel do
      url "https://github.com/bearcove/dodeca/releases/download/v0.4.0/dodeca-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "a4873494799aa1620d3db26c4e0a40ca5c97f3e8b805a786cd9ac74841ed1974"
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
