# frozen_string_literal: true

# draw.io to svg diagram converter for home
class HomeDrawio < Formula
  desc "draw.io to svg diagram converter for home"
  homepage "https://github.com/bearcove/home-drawio"
  version "1.0.1"
  license "Proprietary"


  if OS.mac?
    url "https://github.com/bearcove/home-drawio/releases/download/v1.0.1/aarch64-apple-darwin.tar.xz"
    sha256 "8e48db6202d9c56aef29e8787cd495febbe7542bb7280224e38c254784e46b84"
  elsif OS.linux?
    url "https://github.com/bearcove/home-drawio/releases/download/v1.0.1/x86_64-unknown-linux-gnu.tar.xz"
    sha256 "fbf593d92fde54f022877d5e04950c32df19b1029c6a4800cab5391388a890f1"
  end

  def install
    bin.install "home-drawio"
    libexec.install Dir["lib*.dylib"] if OS.mac?
    libexec.install Dir["lib*.so"] if OS.linux?
  end
end
