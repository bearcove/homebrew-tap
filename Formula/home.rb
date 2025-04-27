# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "2.2.1"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v2.2.1/aarch64-apple-darwin.tar.xz"
    sha256 "3508a1e8a2277efea6276c5e8aa7ef946b4b4f76dd406310601c116507d593ee"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v2.2.1/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "5e9d45063eaac965f7c3373388a362f7d0c45f3c715bf71dfc026ef04f831f90"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v2.2.1/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "3de646d9991fc0eb8b2fb672e7169e7d599f2158307aec80f3a675c22e83f052"
    end
  end

  def install
    bin.install "home"
    libexec.install Dir["lib*.dylib"] if OS.mac?
    libexec.install Dir["lib*.so"] if OS.linux?
  end
end
