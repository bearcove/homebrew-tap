class Dodeca < Formula
  desc "A fully incremental static site generator"
  homepage "https://github.com/bearcove/dodeca"
  version "0.5.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/bearcove/dodeca/releases/download/v0.5.0/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "4fef4b63be2c01ba91d16178bf5e28086650dc3d030bff1dd4056e91fd36d612"
    end
    on_intel do
      # Intel Mac not currently built - use ARM binary under Rosetta or build from source
      url "https://github.com/bearcove/dodeca/releases/download/v0.5.0/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "4fef4b63be2c01ba91d16178bf5e28086650dc3d030bff1dd4056e91fd36d612"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bearcove/dodeca/releases/download/v0.5.0/dodeca-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "fdd51338496de36b2880a93bdf307b522aca1580ed0ea7207007b16c01ade708"
    end
    on_intel do
      url "https://github.com/bearcove/dodeca/releases/download/v0.5.0/dodeca-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "c6ecb4c06135d9f0b5446e2aa7d7210b73fff4dda0e2412ec9ccab40fa38dab1"
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
