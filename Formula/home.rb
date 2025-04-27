# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "2.2.4"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v2.2.4/aarch64-apple-darwin.tar.xz"
    sha256 "85e5beb8f7d4efb10bf2239bc9868fc2c37b76d5a5e5acfec744c63470e6328d"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v2.2.4/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "37ce5c96bc4ecec7dbfcf353a44e82e95d1282fc371c2a6311760e01e0244abb"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v2.2.4/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "18f4b6de22b4a9dc68254ef48427a7bc939806e01e1b93687256e0a765e228bf"
    end
  end

  def install
    bin.install "home"
    libexec.install Dir["lib*.dylib"] if OS.mac?
    libexec.install Dir["lib*.so"] if OS.linux?
  end
end
