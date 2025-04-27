# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "2.2.3"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v2.2.3/aarch64-apple-darwin.tar.xz"
    sha256 "ef36efc0657a1b6f887dd28f2a89c622d12e1e3755968b3fe398a34e21299449"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v2.2.3/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "6c2b01faec57831cddedfd5646ecee1695dcc1f77874809ce75a54b6f3204c4a"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v2.2.3/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "6fa6fe87da4e9ae5b2080d520c15a95e6df40c36d9e13ad779c11262878ca6fd"
    end
  end

  def install
    bin.install "home"
    libexec.install Dir["lib*.dylib"] if OS.mac?
    libexec.install Dir["lib*.so"] if OS.linux?
  end
end
