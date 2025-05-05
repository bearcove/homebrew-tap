# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "2.23.0"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v2.23.0/aarch64-apple-darwin.tar.xz"
    sha256 "8899ac1cabdb94881e9f8933c903434211ccbc353bfc41830c633f976b2b7f6b"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v2.23.0/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "6c8d8d2fbbab1033e5d3321ef20d3b724b119f5e51976fd5a44b4610e7b4d29b"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v2.23.0/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "4f3b83f88990e8f744a75c988bfda7d766ac37e972061dd1cea54574dd7949e5"
    end
  end

  def install
    bin.install "home"
    libexec.install Dir["lib*.dylib"] if OS.mac?
    libexec.install Dir["lib*.so"] if OS.linux?
  end
end
