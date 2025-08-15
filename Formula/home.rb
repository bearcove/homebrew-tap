# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "6.1.1"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v6.1.1/aarch64-apple-darwin.tar.xz"
    sha256 "5a2b7326d3f3c828b73cacd60e00310d8ac47f6b6ff672771c98fdff2134602d"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v6.1.1/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "63f19e0c4641ee54f656317903205878eca5a5116fccaaae1b35bbbadf7a9041"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v6.1.1/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "1ea0d8f6b6946120af778bf14627df0e57434850db0f5521143262e2bae8f5be"
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
