# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "3.4.0"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v3.4.0/aarch64-apple-darwin.tar.xz"
    sha256 "69f551f6bcb8a1be249743d2e7e23c7d6c592d26a0058281cb0aa9169482030a"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v3.4.0/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "36fbd6ed215651ab86b63c13ae924655b417fc98e6627609f06e0493ff4b525f"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v3.4.0/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "dc7df10a0aa3d3a820b491c5d772b52d04c8cc281ed228f064df8ace3577c2c8"
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
