# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "3.1.1"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v3.1.1/aarch64-apple-darwin.tar.xz"
    sha256 "f3d7c78a668265c3c90977a36e8564f3fe721a35d3bd4cdfd253b2ad31c43401"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v3.1.1/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "780d75fef30a83ba6f230f9135971801552c8478a593ce4a8fcf4388ae1cf41e"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v3.1.1/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "b9f8ccd744198381dd8f8e3fc031a549e101cde7fe1ee908b20d22c42319f7c5"
    end
  end

  def install
    bin.install "home"
    libexec.install Dir["lib*.dylib"] if OS.mac?
    libexec.install Dir["lib*.so"] if OS.linux?
  end
end
