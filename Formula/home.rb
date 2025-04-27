# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "2.2.0"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v2.2.0/aarch64-apple-darwin.tar.xz"
    sha256 "625240a524c8ac5b195fb735e819ad593727cfceac3aa3acf485fce6ed771b9f"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v2.2.0/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "073856bd968122bdd119ae397786e6dd023af78c38169498803faf5acefa72ec"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v2.2.0/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "299c1cb71863989570eeeba42e4150b618ff4001ba68d5042159c4cf20cee8eb"
    end
  end

  def install
    bin.install "home"
    libexec.install Dir["lib*.dylib"] if OS.mac?
    libexec.install Dir["lib*.so"] if OS.linux?
  end
end
