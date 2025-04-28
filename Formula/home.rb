# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "2.13.0"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v2.13.0/aarch64-apple-darwin.tar.xz"
    sha256 "9695eb22e9214cf51abac647b68368d6aa725753c3160a7c28d47e6be9b2feab"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v2.13.0/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "b9d4f2738b81359bbd959600683f49153aa504b9f8ee60baf06a23f1684e6865"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v2.13.0/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "6f282f69b893afb67ba08517f51c175a7be0aecf6ca5ed6722612c5eba350cfc"
    end
  end

  def install
    bin.install "home"
    libexec.install Dir["lib*.dylib"] if OS.mac?
    libexec.install Dir["lib*.so"] if OS.linux?
  end
end
