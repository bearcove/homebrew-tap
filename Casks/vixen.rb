cask "vixen" do
  version "0.3.2"
  sha256 "818ce0ee6551eacacfd89e199395cdd1d3a6133a80aa7d41cc51da7e7bf29b61"

  url "https://github.com/bearcove/vixen-mac-app/releases/download/v0.3.2/Vixen-0.3.2.dmg"
  name "Vixen"
  desc "A Rust build engine with correct caching"
  homepage "https://vixen.rs"

  depends_on macos: ">= :tahoe"

  app "Vixen.app"
end
