# frozen_string_literal: true

# A cozy content authoring experience
class Home < Formula
  desc "A cozy content authoring experience"
  homepage "https://github.com/bearcove/home"
  version "3.1.10"
  license "Proprietary"

  depends_on "dav1d"
  depends_on "ffmpeg" => :recommended
  depends_on "uv" => :recommended
  depends_on "imagemagick" => :recommended
  depends_on "node" => :recommended
  depends_on "pnpm" => :recommended
  depends_on "bearcove/tap/home-drawio"

  if OS.mac?
    url "https://github.com/bearcove/home/releases/download/v3.1.10/aarch64-apple-darwin.tar.xz"
    sha256 "bbcb415dfef13e212fcae1b97ec0d88359c55bfd30095f873fc4db0e4cd88745"
  elsif OS.linux?
    on_intel do
      url "https://github.com/bearcove/home/releases/download/v3.1.10/x86_64-unknown-linux-gnu.tar.xz"
      sha256 "35f1115533ff8101148d02febe15b9cab4354750e746527d098ca0ec60c2e82c"
    end
    on_arm do
      url "https://github.com/bearcove/home/releases/download/v3.1.10/aarch64-unknown-linux-gnu.tar.xz"
      sha256 "c62599bec37aa097e49e4d59a10c4a523b414f5e7d8c39d7cc333b770b71fbc7"
    end
  end

  def install
    bin.install "home"
    bin.install "home-*"
    libexec.install Dir["lib*.dylib"] if OS.mac?
    libexec.install Dir["lib*.so"] if OS.linux?
  end
end
