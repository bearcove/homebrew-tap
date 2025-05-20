# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "3.1.2"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v3.1.2/aarch64-apple-darwin.tar.xz"
    sha256 "a4839097575ca06ef8218df41e97ca7e1e1c29406c68a9a0582751b9a6d723f5"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v3.1.2/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "da40bb29c4ae4b52172a2cece4d96705a90d96d73fdf444a11453f7f0b46817e"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v3.1.2/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "0f90500c7b0c0b360dde33807a64d4d4fc40feb71856f12449c3bb7dcbf32301"
    end
  end

  def install
    bin.install "home"
    libexec.install Dir["lib*.dylib"] if OS.mac?
    libexec.install Dir["lib*.so"] if OS.linux?
  end
end
