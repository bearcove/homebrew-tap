# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "2.18.0"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v2.18.0/aarch64-apple-darwin.tar.xz"
    sha256 "9f7f1d4dbeec7e0f5289a49a889fedfbb2496f535650b860739adacbc7876f34"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v2.18.0/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "a1bc1aa8a8a6d1773738a250f1ab98c83e04b56fb96a5e98965802d1f781183b"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v2.18.0/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "9b67143287f6e7d27948f9f768c0ed3caac17df7eec5810f2130eff30ca91d9d"
    end
  end

  def install
    bin.install "home"
    libexec.install Dir["lib*.dylib"] if OS.mac?
    libexec.install Dir["lib*.so"] if OS.linux?
  end
end
