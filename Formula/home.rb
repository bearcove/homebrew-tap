# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "2.16.0"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v2.16.0/aarch64-apple-darwin.tar.xz"
    sha256 "caf1cf8eda1cdda71c66a12699bcec31f740d2fa28cc9470eb59b038280e9ec2"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v2.16.0/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "7d62ec11368d61cf8838ff367f70f8aadf767bcc44b693790c3eebbaef58405f"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v2.16.0/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "032ce4614f694ac195c8b362f48a0f57da1dd1877cb92833c0ecfcce56ce3405"
    end
  end

  def install
    bin.install "home"
    libexec.install Dir["lib*.dylib"] if OS.mac?
    libexec.install Dir["lib*.so"] if OS.linux?
  end
end
