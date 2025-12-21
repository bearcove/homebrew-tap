class Dodeca < Formula
  desc "A fully incremental static site generator"
  homepage "https://github.com/bearcove/dodeca"
  version "0.6.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/bearcove/dodeca/releases/download/v0.6.2/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "ec0cfda388ea4284cadd12cfe32b5aac593e207bc17edb16aa463dc124459bb9"
    end
    on_intel do
      url "https://github.com/bearcove/dodeca/releases/download/v0.6.2/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "ec0cfda388ea4284cadd12cfe32b5aac593e207bc17edb16aa463dc124459bb9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bearcove/dodeca/releases/download/v0.6.2/dodeca-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "007e49c3febc0bc6ece4e6e6f2fdf987ca5cb0254ef59c733681e3460399607b"
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
