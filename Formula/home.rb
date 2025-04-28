# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "2.20.0"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v2.20.0/aarch64-apple-darwin.tar.xz"
    sha256 "de233d328989b772ccbdd4479847ea77e8c86f52987fbfcd0407a7d4863f4e41"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v2.20.0/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "027267f5c079cfed03686b1fcc8038e594893718a8bd6d919eb4327c8ffd314b"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v2.20.0/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "7e468f5f6c2b5efe2aa8b3238be0c6a3eb027f2829c7e9923391f33086117b0c"
    end
  end

  def install
    bin.install "home"
    libexec.install Dir["lib*.dylib"] if OS.mac?
    libexec.install Dir["lib*.so"] if OS.linux?
  end
end
