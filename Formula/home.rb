# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "2.24.0"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v2.24.0/aarch64-apple-darwin.tar.xz"
    sha256 "8b1ada46f949a08f647499d7fbab58c72e18dc90929311a214a30fc95e501939"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v2.24.0/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "9dd5ab92a8fc884df92b155ddd0c2eb9eca3ca04517a5b06b495334f3b254b54"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v2.24.0/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "d97f74811391f4c9c07538edd501cc9947d65e22fa114f067c1eeebb2a49615e"
    end
  end

  def install
    bin.install "home"
    libexec.install Dir["lib*.dylib"] if OS.mac?
    libexec.install Dir["lib*.so"] if OS.linux?
  end
end
