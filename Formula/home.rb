# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "3.1.4"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v3.1.4/aarch64-apple-darwin.tar.xz"
    sha256 "5bf6b104491b255a94c86d347ec5019e476327a443788bd8fe952be3efb0b983"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v3.1.4/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "be417739ca36b24ee1d9c467b571435c6c497ae2a307cdbad59ddefadc925256"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v3.1.4/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "4fb6b3f203bf9319870dc2d529b0b1f994e03e599df2a0c42e2c39ab4dd8df98"
    end
  end

  def install
    bin.install "home"
    libexec.install Dir["lib*.dylib"] if OS.mac?
    libexec.install Dir["lib*.so"] if OS.linux?
  end
end
