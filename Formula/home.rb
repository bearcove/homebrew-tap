# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "1.0.2"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v1.0.2/aarch64-apple-darwin.tar.xz"
    sha256 "e31a9ceb2747e42f0f8597c55c52165f0b0ae8d9b7dbc793b6642a70ba5e761a"
  elsif OS.linux?
    url "https://github.com/bearcove/home/releases/download/v1.0.2/x86_64-unknown-linux-gnu.tar.xz"
    sha256 "dcfc65b99d73b4a52b4f45146c60fc4d2735dabad857a3d79e09c95d946506c0"
  end

  def install
    bin.install "home"
    libexec.install Dir["lib*.dylib"] if OS.mac?
    libexec.install Dir["lib*.so"] if OS.linux?
  end
end
