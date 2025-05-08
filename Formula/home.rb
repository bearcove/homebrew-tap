# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "2.25.0"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v2.25.0/aarch64-apple-darwin.tar.xz"
    sha256 "43b2a80fbfc4caa4d11dec7c1b04c9aa8a88736541209dcb9a8397f1f261315a"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v2.25.0/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "483235919628a0112b002cea672390d88d8eb19e2383b0e10165d32f87df7a0a"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v2.25.0/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "1da427fcf37b7c96ad4a53403846863f299bf2b4bdbece19dcc87c34a37a0f92"
    end
  end

  def install
    bin.install "home"
    libexec.install Dir["lib*.dylib"] if OS.mac?
    libexec.install Dir["lib*.so"] if OS.linux?
  end
end
