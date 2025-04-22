# frozen_string_literal: true

# draw.io to svg diagram converter for home
class HomeDrawio < Formula
  desc "draw.io to svg diagram converter for home"
  homepage "https://github.com/bearcove/home-drawio"
  version "1.0.2"
  license "Proprietary"


  if OS.mac?
    url "https://github.com/bearcove/home-drawio/releases/download/v1.0.2/aarch64-apple-darwin.tar.xz"
    sha256 "7deae1f8ae35ac5e1b45ec88c9ae2aee9f577898e0334f24ad7f442717a7040d"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home-drawio/releases/download/v1.0.2/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "c551a29df1918e773ac079b99d1f59a921843dee6f061318292cd9c77ee71ae1"
    end
    on_arm do
      url "https://github.com/bearcove/home-drawio/releases/download/v1.0.2/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "5d0dccb2144de5f07a16e4c812498a9753fda9bc715a3bcc8d966f2a33fd1929"
    end
  end

  def install
    bin.install "home-drawio"
    libexec.install Dir["lib*.dylib"] if OS.mac?
    libexec.install Dir["lib*.so"] if OS.linux?
  end
end
