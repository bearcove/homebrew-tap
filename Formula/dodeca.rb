class Dodeca < Formula
  desc "A fully incremental static site generator"
  homepage "https://github.com/bearcove/dodeca"
  version "0.8.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/bearcove/dodeca/releases/download/v0.8.1/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "1cd88e292f638815a3645fcfbe08b59358efc41d457a90d387fc582c77b96b19"
    end
    on_intel do
      url "https://github.com/bearcove/dodeca/releases/download/v0.8.1/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "1cd88e292f638815a3645fcfbe08b59358efc41d457a90d387fc582c77b96b19"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bearcove/dodeca/releases/download/v0.8.1/dodeca-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "84acb419d00e6c58acc334f0c6fa95b50027191fd7b75fd66263c4a3752c8666"
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
