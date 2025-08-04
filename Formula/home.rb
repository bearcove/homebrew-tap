# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "3.7.0"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v3.7.0/aarch64-apple-darwin.tar.xz"
    sha256 "d959c68030a2bf671c9d491c37965bdbc65780fb92374c9b768918830f6d462a"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v3.7.0/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "335bb4beac3a3b2c8210c61b04f896b069cbde647106d63bb54e9ec4748e2be5"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v3.7.0/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "9bdec915c00c99e1c6c55e5634d4883ea2fd6d75ea089290822e22b9eaee7f91"
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
