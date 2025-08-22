# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "6.3.0"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v6.3.0/aarch64-apple-darwin.tar.xz"
    sha256 "3309a1f103952366c3eeba8220a76f92e5bcb4071a6c95c2d3000e956d5dc446"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v6.3.0/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "9a581cb026250f1ff5791d42debbddc36d62bdb714611f13e73502f975b77b36"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v6.3.0/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "326efc3d50517c5ac39013d6f9996f70165baf92f2cbd15224b5bf8ce45d7764"
    end
  end

  def install
    bin.install "home"
    bin.install "home-mom"
    bin.install "home-serve"
    bin.install "home-term"
    bin.install "home-init"
    libexec.install Dir["lib*.dylib"] if OS.mac?
    libexec.install Dir["lib*.so"] if OS.linux?
  end
end
