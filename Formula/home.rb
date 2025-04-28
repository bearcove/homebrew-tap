# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "2.19.0"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v2.19.0/aarch64-apple-darwin.tar.xz"
    sha256 "79a497b0629729da199b579c35a0cdf8c58cd4168d355e9a610226faab3a9106"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v2.19.0/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "419f1b023b0461d6ced922a6624237b52258a5cfb9e760110cccf642d92bc9ee"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v2.19.0/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "3eec34c76f4145a687fee424e94a39ebf2586067febfa6a4547fe7000aec0dd5"
    end
  end

  def install
    bin.install "home"
    libexec.install Dir["lib*.dylib"] if OS.mac?
    libexec.install Dir["lib*.so"] if OS.linux?
  end
end
