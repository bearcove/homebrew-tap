class Dodeca < Formula
  desc "A fully incremental static site generator"
  homepage "https://dodeca.bearcove.eu/"
  version "0.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/bearcove/dodeca/releases/download/v0.1.0/dodeca-aarch64-apple-darwin.tar.xz"
      sha256 "039bcff8b50523b72709032f2451c6592e0a4ad4d52a95925e2b2bec71baabf7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bearcove/dodeca/releases/download/v0.1.0/dodeca-x86_64-apple-darwin.tar.xz"
      sha256 "bf8937914ebf517c0f7d141b3e9948217bf2d53ff4676c17ea509aa04c1dfa37"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/bearcove/dodeca/releases/download/v0.1.0/dodeca-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "9619c80b2b511ea4a639c8f6d68422d6b09fbde185c5f3bb8e5b115e128e23b4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bearcove/dodeca/releases/download/v0.1.0/dodeca-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "b6ac08bd74d924c7140d6587487e2e5c08a85cd2a5e3072d12cd7a188517d458"
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
