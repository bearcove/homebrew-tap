# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "2.22.0"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v2.22.0/aarch64-apple-darwin.tar.xz"
    sha256 "02d24fb118cfc4f01e0a7f2ba1a831b1e74b76845b208390d9c7072d795a8f4e"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v2.22.0/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "d2533baf4295172daf901be409fc18e0e71a6670e3d0a8d757012142b06fc2e6"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v2.22.0/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "79cc4a34805ec5c36dc31ac466ce85cb402dd61650eab1503f5d63f3081e1f8a"
    end
  end

  def install
    bin.install "home"
    libexec.install Dir["lib*.dylib"] if OS.mac?
    libexec.install Dir["lib*.so"] if OS.linux?
  end
end
