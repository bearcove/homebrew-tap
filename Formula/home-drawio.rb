# frozen_string_literal: true

# draw.io to svg diagram converter for home
class HomeDrawio < Formula
  desc "draw.io to svg diagram converter for home"
  homepage "https://github.com/bearcove/home-drawio"
  version "1.0.3"
  license "Proprietary"


  if OS.mac?
    url "https://github.com/bearcove/home-drawio/releases/download/v1.0.3/aarch64-apple-darwin.tar.xz"
    sha256 "8e4bd2290fbe4d98ea26a9118cdb8316b650379ee6162bb0a0c7e37ee7dd349e"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home-drawio/releases/download/v1.0.3/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "4b333f9ef7ce81b38ab79f995c6f1e69ddcfacc3f3e909fcabb19ec2acad6622"
    end
    on_arm do
      url "https://github.com/bearcove/home-drawio/releases/download/v1.0.3/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "dd69dfd7be71c81425e5b15f5b1da33df8eb1991e23250caa4837230e64fb534"
    end
  end

  def install
    bin.install "home-drawio"
    libexec.install Dir["lib*.dylib"] if OS.mac?
    libexec.install Dir["lib*.so"] if OS.linux?
  end
end
