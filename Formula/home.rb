# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "5.1.0"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v5.1.0/aarch64-apple-darwin.tar.xz"
    sha256 "d89593dc7e8420d924b4c27976b2840ac677041dd9a68d626801672758c68248"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v5.1.0/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "598bf30f26841218a679c95621c905ac7fbbc21412ce780089ec939752ca8f6d"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v5.1.0/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "1e0997a4675b60ae492d516708fc4dc8388b4eac6268ccee3d4f2eeb216567fa"
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
