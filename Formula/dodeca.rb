class Dodeca < Formula
  desc "A fully incremental static site generator"
  homepage "https://github.com/bearcove/dodeca"
  version "0.14.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/bearcove/dodeca/releases/download/v0.14.1/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "98235a2b0245e61c208f4a1b9aaf71e807bcbce81fa9a9341a230a16e2f37e1b"
    end
    on_intel do
      url "https://github.com/bearcove/dodeca/releases/download/v0.14.1/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "98235a2b0245e61c208f4a1b9aaf71e807bcbce81fa9a9341a230a16e2f37e1b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bearcove/dodeca/releases/download/v0.14.1/dodeca-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "5736ee50a5054e08c5a5fd52b04b9b7339aa90c6f90ef03670debe2d77ada4f2"
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
