# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "3.6.0"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v3.6.0/aarch64-apple-darwin.tar.xz"
    sha256 "2611844437a181b89c8156154fbd98312b6aa8a3e1897f7082b327e6a93328eb"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v3.6.0/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "5b32724cf8ad3167e824fa3a2411846b493bcb702080cec5e1bc207ad534bae8"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v3.6.0/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "a0940c03613927b9d0dfeac372a9f2030421ed9a1fd7460d24adb7b3be734cb7"
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
