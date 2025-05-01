# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "2.21.0"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v2.21.0/aarch64-apple-darwin.tar.xz"
    sha256 "51f61f46d1b2d015af5a35616148b4ea6f4df1f92f7cecca9a3f9396e2d7da0b"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v2.21.0/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "362309c71fc09970c91854efa06d9956e8e88fd46dc764750fc9eddacb594251"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v2.21.0/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "70d007f6e5d930c39a04bb2574651ee794e21fb1e9ff3322583f3befcf3d39fe"
    end
  end

  def install
    bin.install "home"
    libexec.install Dir["lib*.dylib"] if OS.mac?
    libexec.install Dir["lib*.so"] if OS.linux?
  end
end
