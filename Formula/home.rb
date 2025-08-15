# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "6.1.2"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v6.1.2/aarch64-apple-darwin.tar.xz"
    sha256 "fa66efd0df7a976ec8d972e19c4bacf2f64eec8ec7ef64e528883ed377cc8ece"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v6.1.2/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "48d016f433c1275e77573c044903975cdf9de79e457cb33cb8de404939e01141"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v6.1.2/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "8809bf1b995892df2e8db2f14385b1d987b7827ca57af9959d167493549f2b70"
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
