# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "2.17.0"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v2.17.0/aarch64-apple-darwin.tar.xz"
    sha256 "4826c22f7c84f38c979a938b6dd210b56a0b7f73e739f8f0036b37e2726effe1"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v2.17.0/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "dbef52b1f9e54cbe1f007d2344d787ef4b979da6a6b4745290dc1823cd6d3f01"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v2.17.0/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "c2fc01741f92acdc98d42c1faf5bbffab3dee2c585cf7c3db73fc3c3057b4664"
    end
  end

  def install
    bin.install "home"
    libexec.install Dir["lib*.dylib"] if OS.mac?
    libexec.install Dir["lib*.so"] if OS.linux?
  end
end
