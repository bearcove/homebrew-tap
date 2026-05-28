class Dodeca < Formula
  desc "A fully incremental static site generator"
  homepage "https://github.com/bearcove/dodeca"
  version "0.14.3"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/bearcove/dodeca/releases/download/v0.14.3/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "6bc7f83b1b85da860c3ccde142ba822a0234c54a940e704dcd592def8cb485e7"
    end
    on_intel do
      url "https://github.com/bearcove/dodeca/releases/download/v0.14.3/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "6bc7f83b1b85da860c3ccde142ba822a0234c54a940e704dcd592def8cb485e7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bearcove/dodeca/releases/download/v0.14.3/dodeca-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "b5c836a9f4593d6c4602872437b5e7001a542fe38ffb6d0e8343bd955b3609c1"
    end
  end

  def install
    bin.install "ddc"
    # Install plugins
    if File.directory?("plugins")
      (lib/"dodeca/plugins").install Dir["plugins/*"]
    end
  end

  test do
    system "#{bin}/ddc", "--version"
  end
end
