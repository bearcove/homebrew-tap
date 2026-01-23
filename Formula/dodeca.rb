class Dodeca < Formula
  desc "A fully incremental static site generator"
  homepage "https://github.com/bearcove/dodeca"
  version "0.10.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/bearcove/dodeca/releases/download/v0.10.0/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "250214b4766a0f6c3ef76725cfd5597f7df45dae9414eff28c313d6b73daa32a"
    end
    on_intel do
      url "https://github.com/bearcove/dodeca/releases/download/v0.10.0/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "250214b4766a0f6c3ef76725cfd5597f7df45dae9414eff28c313d6b73daa32a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bearcove/dodeca/releases/download/v0.10.0/dodeca-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "892397f03b7cdad5bac495efe2f85e06f00808c1671190f6800c4b5edda72031"
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
