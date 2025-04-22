# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "1.1.0"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v1.1.0/aarch64-apple-darwin.tar.xz"
    sha256 "e5aa5fa0b5eb6330cdcc78da89e1d2bcf59e6a02c9ed5a9e6482538d8d6b8a46"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v1.1.0/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "d016a458ad9e4348ae79b52b8cadcfe1e87e2fc37a569ccfb9bb881b1e23fca8"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v1.1.0/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "21aded5c71ca0662b1854979ff080a5079ddabe46372ba58636c9fd368d35392"
    end
  end

  def install
    bin.install "home"
    libexec.install Dir["lib*.dylib"] if OS.mac?
    libexec.install Dir["lib*.so"] if OS.linux?
  end
end
