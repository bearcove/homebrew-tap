# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "3.1.7"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v3.1.7/aarch64-apple-darwin.tar.xz"
    sha256 "531c8b172487089a221ce1fdd2d467999432dcbdd2d9ca3435ee0ff7253e6b00"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v3.1.7/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "9552b8ad65fb10659cdd9c93282ac3032f819b65c9525973d4f98d5775d14056"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v3.1.7/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "11f722b4417bfe793a22b87a9e1432987423e3bcf4b1614f6d8b5ce4a3c25725"
    end
  end

  def install
    bin.install "home"
    libexec.install Dir["lib*.dylib"] if OS.mac?
    libexec.install Dir["lib*.so"] if OS.linux?
  end
end
