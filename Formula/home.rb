# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "6.1.0"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v6.1.0/aarch64-apple-darwin.tar.xz"
    sha256 "c4a382ec4ce43a77cdb61cb6542ac291ab197edec6ffe82d9eddaf8cccb5fb00"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v6.1.0/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "363e072c0660f6d59d42d0ac0025cbc9cd1232ce880b2bfb9f244fd95a5b556c"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v6.1.0/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "297f3f1e0cc9aecece40120c0b08e9ebd5ab8f0774cc96e59be38c853c150dd1"
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
