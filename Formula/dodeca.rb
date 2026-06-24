class Dodeca < Formula
  desc "A fully incremental static site generator"
  homepage "https://github.com/bearcove/dodeca"
  version "0.16.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/bearcove/dodeca/releases/download/v0.16.0/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "812a857c1e452afea9dd650120e1ff86ffef2fe0deb295a10a1bb4864dc19015"
    end
    on_intel do
      url "https://github.com/bearcove/dodeca/releases/download/v0.16.0/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "812a857c1e452afea9dd650120e1ff86ffef2fe0deb295a10a1bb4864dc19015"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bearcove/dodeca/releases/download/v0.16.0/dodeca-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "8e8e9ff286aa89f096e3dfe3ffc5cb1c78b9c3681eb380fd0a926a232de9df43"
    end
  end

  def install
    bin.install "ddc"
  end

  test do
    system "#{bin}/ddc", "--version"
  end
end
