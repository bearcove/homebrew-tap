# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "4.0.0"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v4.0.0/aarch64-apple-darwin.tar.xz"
    sha256 "04408a0bdd4dd8693d4697b995513bafa4d7da66e7523c80f89f763d8a090a34"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v4.0.0/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "883a8ae9ec38bca62c6bab0d3c7243ef7f684b7ab3a776d5dad344164fce361c"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v4.0.0/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "463d718b7c6de2d3ae492a514a416af88e1634a92dd8270d4b157e750f5a0e23"
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
