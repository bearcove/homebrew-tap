# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "3.3.2"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v3.3.2/aarch64-apple-darwin.tar.xz"
    sha256 "470344bccd0465f0ee5374245af02d198f559ca8e5cef43cbba92c63987e6994"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v3.3.2/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "42ff0588f53546424f9d62888302b2b83a4683f14d669e6ea3c87ae4ca0b541c"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v3.3.2/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "4caf7e941b329c25703484a7495027f4626e14d73d1c5649aa2092d615f71c44"
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
