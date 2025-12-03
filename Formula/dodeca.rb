class Dodeca < Formula
  desc "A fully incremental static site generator"
  homepage "https://dodeca.bearcove.eu/"
  version "0.2.11"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/bearcove/dodeca/releases/download/v0.2.11/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "b3c6e705036344aea8ac03ce412842b741e76e4d38261e4acaf67fe8d710317d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bearcove/dodeca/releases/download/v0.2.11/dodeca-x86_64-apple-darwin.tar.xz"
      sha256 "fc9c0f6e390279e83f62a344c06d26d942d0de76bcedcacabac301c7760fe356"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/bearcove/dodeca/releases/download/v0.2.11/dodeca-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "d2fbace5d8c050431416f681472e63cae59c3ae1d2a276701001002adc98e448"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bearcove/dodeca/releases/download/v0.2.11/dodeca-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "4e4cffb0f3e7f72d8ad0b5baa4239bcd368ad7a37939db2f4d58305f58f4369f"
    end
  end
  license any_of: ["MIT", "Apache-2.0"]

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-pc-windows-gnu":     {},
    "x86_64-unknown-linux-gnu":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    bin.install "ddc" if OS.mac? && Hardware::CPU.arm?
    bin.install "ddc" if OS.mac? && Hardware::CPU.intel?
    bin.install "ddc" if OS.linux? && Hardware::CPU.arm?
    bin.install "ddc" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
