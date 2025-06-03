# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "3.3.0"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v3.3.0/aarch64-apple-darwin.tar.xz"
    sha256 "77d05f2672e6284b3b95448168cb94085b28fbfa49dee82f0669f55eac3c96fa"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v3.3.0/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "2e51bbabb3903b7648d239dc266cf66bde3874ff273b3441efcdc3d2cde8e745"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v3.3.0/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "7c58f58a7a4a0426cb814b5b05584624c215cd19c185fe374d069c3d9d9658f8"
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
