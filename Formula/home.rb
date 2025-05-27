# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "3.1.8"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v3.1.8/aarch64-apple-darwin.tar.xz"
    sha256 "b979b6756e7bedea67556a3b772d191be1a80b5257a31f7fddaebc1053e1a1ac"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v3.1.8/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "033530c5bc5651f3abdc685068d0bdb54f5d36b129a03e941ec1f604e51c222d"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v3.1.8/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "8aa6aee69411ce4c5f309c72dc044b3e30fc7eebd78d0b25a0ed8dc916938e1d"
    end
  end

  def install
    bin.install "home"
    bin.install "home-*"
    libexec.install Dir["lib*.dylib"] if OS.mac?
    libexec.install Dir["lib*.so"] if OS.linux?
  end
end
