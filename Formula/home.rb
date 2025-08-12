# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "5.0.0"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v5.0.0/aarch64-apple-darwin.tar.xz"
    sha256 "172026166c1e69c3fe609632ce373a44512f01aef1efb21bd0584887f12973c5"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v5.0.0/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "4dd218fa47ef7b81e03db2868e098769f9e110a094c3c2609175f0c5f89446b3"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v5.0.0/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "d41ee2beead2790c9a96382cefb0a835991e3e325c957eadd623502c2006528a"
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
