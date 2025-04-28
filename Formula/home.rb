# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "2.15.0"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v2.15.0/aarch64-apple-darwin.tar.xz"
    sha256 "b59312d2b615662cd788a6510daa4b5acc86fe6fc7f49b4c7482598640f62a19"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v2.15.0/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "208db2a69fbaf5d07407bd8761ebebdc1f668e8f892ab5e56f452d4be7bedff2"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v2.15.0/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "20d81fcb137dea2a21eb2b8b1c5916fc774872890073d86908d4023c7ca62e21"
    end
  end

  def install
    bin.install "home"
    libexec.install Dir["lib*.dylib"] if OS.mac?
    libexec.install Dir["lib*.so"] if OS.linux?
  end
end
