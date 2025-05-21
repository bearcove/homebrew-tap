# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "3.1.6"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v3.1.6/aarch64-apple-darwin.tar.xz"
    sha256 "bc4dc17e3c8d2bb7321f43ff866adfba8df4f3c4dd096328c4c590f32a2de7c3"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v3.1.6/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "7b16b1164de196ecbf15d4eb3ae00c0e4365f41799e03d7b365578dfe906af26"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v3.1.6/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "4e9df94d02cebe680b0ebed785f5660fc8dac823b2cc9a2685338da6bdc314ff"
    end
  end

  def install
    bin.install "home"
    libexec.install Dir["lib*.dylib"] if OS.mac?
    libexec.install Dir["lib*.so"] if OS.linux?
  end
end
