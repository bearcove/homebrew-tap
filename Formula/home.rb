# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "3.3.3"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v3.3.3/aarch64-apple-darwin.tar.xz"
    sha256 "2936fd2dfe13f089ca9fda79b8cb3a51f001392ed9026183657f6edb8b48dd36"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v3.3.3/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "8284d18bc055daed520363a466cb345ef0039b0cfbe9e04d353530847d62056c"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v3.3.3/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "c426a6190339bd2587810830fa8d3262ba48581ae4103dd433e802b3c840b2e9"
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
