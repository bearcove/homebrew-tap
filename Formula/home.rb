# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "3.0.0"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v3.0.0/aarch64-apple-darwin.tar.xz"
    sha256 "56e9244ae3079a124f0fc363ea61638f44cf5fa1d19b7b67059e36cccb48136d"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v3.0.0/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "79b6f9c711466ffc7492e797381547891e5c139f72615fb6f484d329aac2e6e0"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v3.0.0/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "9e2cf051b3c7094d45805084f34926f931383d522736ab9e36c196d907d3a333"
    end
  end

  def install
    bin.install "home"
    libexec.install Dir["lib*.dylib"] if OS.mac?
    libexec.install Dir["lib*.so"] if OS.linux?
  end
end
