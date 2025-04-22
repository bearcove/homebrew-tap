# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "1.0.6"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v1.0.6/aarch64-apple-darwin.tar.xz"
    sha256 "a7da7225bc988c439e8459db881f7ca38381abae5ee2d9101eff0a7530d1b552"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v1.0.6/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "97acac42964bbae3708f274dc505acff8c94d2aee0fbb3602624ad2e472a8d31"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v1.0.6/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "8977403ea76006a9a62c8a6f2fa59beb24be4c6bc9cd97530646928652c95424"
    end
  end

  def install
    bin.install "home"
    libexec.install Dir["lib*.dylib"] if OS.mac?
    libexec.install Dir["lib*.so"] if OS.linux?
  end
end
