# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "2.2.2"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v2.2.2/aarch64-apple-darwin.tar.xz"
    sha256 "f53abee44578b3ff143bd766a5e975707fc2711f1387893dc26b23dbac697018"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v2.2.2/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "43d4b2638c5a95ab8818892d554643e6e8baeb0825f6ba90df63613f6d1b7a7c"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v2.2.2/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "0131f39231f5b5d9e978a5d5b75528086aae95c43bf327bb36b15f8b089aa3c6"
    end
  end

  def install
    bin.install "home"
    libexec.install Dir["lib*.dylib"] if OS.mac?
    libexec.install Dir["lib*.so"] if OS.linux?
  end
end
