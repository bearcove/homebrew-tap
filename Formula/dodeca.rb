class Dodeca < Formula
  desc "A fully incremental static site generator"
  homepage "https://github.com/bearcove/dodeca"
  version "0.10.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/bearcove/dodeca/releases/download/v0.10.1/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "cd6ae21344b77a0065b728cd6cd4999bd0045712d41f54c4234e66eb3aa168c0"
    end
    on_intel do
      url "https://github.com/bearcove/dodeca/releases/download/v0.10.1/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "cd6ae21344b77a0065b728cd6cd4999bd0045712d41f54c4234e66eb3aa168c0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bearcove/dodeca/releases/download/v0.10.1/dodeca-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "820387d13769ac588d1ccae6461eb6038b466f8a7843b655399b05a0aa69723e"
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
