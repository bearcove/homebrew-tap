# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "2.3.0"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v2.3.0/aarch64-apple-darwin.tar.xz"
    sha256 "596a00d4aa218a269a2ae90f045a2d792ce0ddc5e0ecb8a4b0190640177fce9f"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v2.3.0/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "992fbfcc79a543fcef817567007c7d6ced1f60f095277f7734b13bb9e12c5fdc"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v2.3.0/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "87bcbb28096ce0186343134c84599e9601ff10d93064b5476f8da596cd4d78b6"
    end
  end

  def install
    bin.install "home"
    libexec.install Dir["lib*.dylib"] if OS.mac?
    libexec.install Dir["lib*.so"] if OS.linux?
  end
end
