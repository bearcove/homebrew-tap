# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "3.3.1"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v3.3.1/aarch64-apple-darwin.tar.xz"
    sha256 "c371ebb10eb3e7bf6fef610e381883760aae122929d24e1ca6a28a24713c92a8"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v3.3.1/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "5604cbf3df7d70b8e17337af7dc23f2a7f400f8881db0168a3d26a507b6f4ca9"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v3.3.1/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "a14d5a857b20184a97220c3e863f91d393ab1cec78cea57a347c6394ca7491e3"
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
