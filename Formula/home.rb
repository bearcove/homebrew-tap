# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "2.14.0"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v2.14.0/aarch64-apple-darwin.tar.xz"
    sha256 "034b881d27d34be38c71898ac8ad0e90cf5ce3292abdbae8e6d715e659b75549"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v2.14.0/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "894cb5fa59b7b54d862a819d1ea4ac12b5f82a56e6248a482bd82fc94c74df33"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v2.14.0/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "7c5b06e3607a85cb9bae64b00a7edad2a475534d33c34da4eeffdede1fe0e399"
    end
  end

  def install
    bin.install "home"
    libexec.install Dir["lib*.dylib"] if OS.mac?
    libexec.install Dir["lib*.so"] if OS.linux?
  end
end
