# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "3.2.3"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v3.2.3/aarch64-apple-darwin.tar.xz"
    sha256 "55f7a3bae384ec004207b0da6d86a56127678e3202b46bcc18ca0986e9fd5b8b"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v3.2.3/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "afd4ffd598f3b4b335dc8c7d1c68fcd6c9ab5c85423e7b2096d13b403ed2771a"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v3.2.3/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "34b517f06a2a72e7caa72f478fdafa3ba6e9b5b949a03b0a725cf7060d86881e"
    end
  end

  def install
    bin.install "home"
    bin.install "home-*"
    libexec.install Dir["lib*.dylib"] if OS.mac?
    libexec.install Dir["lib*.so"] if OS.linux?
  end
end
