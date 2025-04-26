# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "2.1.0"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v2.1.0/aarch64-apple-darwin.tar.xz"
    sha256 "0ae6ff8e288de6e5ab8334f41ad657013dd82b49b8ffd78a7601922390234ae3"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v2.1.0/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "58db645029c12cdb5a69a2810cf0b46d30a0069fee5e39062eb7e01ba7555b18"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v2.1.0/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "2a8ba357064efcbdf729025067212d2a481754a435b27f74312f79fd252f35aa"
    end
  end

  def install
    bin.install "home"
    libexec.install Dir["lib*.dylib"] if OS.mac?
    libexec.install Dir["lib*.so"] if OS.linux?
  end
end
