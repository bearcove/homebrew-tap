# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "6.3.1"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v6.3.1/aarch64-apple-darwin.tar.xz"
    sha256 "45b62a2963f5be15d77f17037cf17561a948c355cb6d382f1a3e9747a6a7acf2"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v6.3.1/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "68ff601cf005ba5826917fc8d8b19481b4149875be651e39687cb2d5ed8ab270"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v6.3.1/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "e8ae54917b96e66abdfb88d09d2aa20d84c5e86602a4baf75237e9f15c5c1a5b"
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
