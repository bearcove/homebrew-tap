# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "6.1.3"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v6.1.3/aarch64-apple-darwin.tar.xz"
    sha256 "38a3e38a0493a4f9033031545217543f1e41d12a1736b4eff6d83d8820302e4c"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v6.1.3/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "4a6014c42be8032240cc5007bf19de08588a3293b158711b2526acc421033ba6"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v6.1.3/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "d5a10d4c4ebed27212506839aac4fbd04a835c0f56c824d9a48575ddc82bee96"
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
