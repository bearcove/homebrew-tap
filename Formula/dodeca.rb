class Dodeca < Formula
  desc "A fully incremental static site generator"
  homepage "https://github.com/bearcove/dodeca"
  version "0.6.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/bearcove/dodeca/releases/download/v0.6.1/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "bed11a5457161ce8ce038ee0139cd7fbb36b20f368ea1f11ef415f8f0cccf2eb"
    end
    on_intel do
      url "https://github.com/bearcove/dodeca/releases/download/v0.6.1/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "bed11a5457161ce8ce038ee0139cd7fbb36b20f368ea1f11ef415f8f0cccf2eb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bearcove/dodeca/releases/download/v0.6.1/dodeca-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "572b76a8ea7eb354125979684a26649d028c474a1b4efd83c64bae83395833f7"
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
