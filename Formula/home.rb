# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "3.5.0"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v3.5.0/aarch64-apple-darwin.tar.xz"
    sha256 "e8d9d8835a9edb71924e0c20d70adf52d1c8fec568b7e5f45e5ddfa666c9a0ad"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v3.5.0/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "19a6fa63798c9bb0252ea5662c1441996a225315f2b527a9d01c917ce26eb699"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v3.5.0/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "d53810eb5fb0ac582ccb8cc1804c4e6247d2602b7723c2502add58b858bcb4ad"
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
