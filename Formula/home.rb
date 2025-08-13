# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "6.0.0"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v6.0.0/aarch64-apple-darwin.tar.xz"
    sha256 "3f05493cc37b4f587be218b2005fcd4f4d165132384326a65ca7a45a2dfb278c"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v6.0.0/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "9b710c5e71ab47cf47cdc2a23ea401d4a734499afd14005b881dc29a4b93c4fe"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v6.0.0/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "dec4fd117f600b59eb3644ac0938c9044a188813161a584bd1498b1a814a9963"
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
