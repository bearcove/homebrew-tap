# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "1.0.5"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v1.0.5/aarch64-apple-darwin.tar.xz"
    sha256 "e4f9e51db7dcfb1cba80a568a53f70ca2738c80b8fe08e57905eef07508e1c6d"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v1.0.5/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "e29ac23f03c708eb661b6feb2724346393a0c0fb8dd9169f9ef67c64d44911c8"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v1.0.5/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "babde9e602159e6261f45d9e4b9d3e687609d0fcf1330b39522b443abec374ab"
    end
  end

  def install
    bin.install "home"
    libexec.install Dir["lib*.dylib"] if OS.mac?
    libexec.install Dir["lib*.so"] if OS.linux?
  end
end
