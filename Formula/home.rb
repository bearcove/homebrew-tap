# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "3.2.1"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v3.2.1/aarch64-apple-darwin.tar.xz"
    sha256 "7e183a0c453fed9a26222486300a539087c8226d38d332ceea81315bfbc6f7d2"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v3.2.1/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "7d8ba7d225d7090b5ab8e43c7f4f1cbc4b25977347ec42c28b51cc3123d79b27"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v3.2.1/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "9ef937734e608d376f4d87e64866ff895b6fd8ce62ce529c0113d97354c8c76c"
    end
  end

  def install
    bin.install "home"
    bin.install "home-*"
    libexec.install Dir["lib*.dylib"] if OS.mac?
    libexec.install Dir["lib*.so"] if OS.linux?
  end
end
