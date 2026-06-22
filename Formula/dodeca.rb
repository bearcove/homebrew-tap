class Dodeca < Formula
  desc "A fully incremental static site generator"
  homepage "https://github.com/bearcove/dodeca"
  version "0.15.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/bearcove/dodeca/releases/download/v0.15.0/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "b52b05204033385797428884fd85ad098843ad5527a04289de107fa12293a4f7"
    end
    on_intel do
      url "https://github.com/bearcove/dodeca/releases/download/v0.15.0/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "b52b05204033385797428884fd85ad098843ad5527a04289de107fa12293a4f7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bearcove/dodeca/releases/download/v0.15.0/dodeca-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "20c42fc3934f5a788bb8c429adbbead5666880a9d8af3672480d5969c21dd46a"
    end
  end

  def install
    bin.install "ddc"
  end

  test do
    system "#{bin}/ddc", "--version"
  end
end
