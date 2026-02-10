cask "vixen" do
  version "0.4.1"
  sha256 "c33a40950628e19e9504106c517ebc50a805421c9f1294ad9fad07c6be71b6ad"

  url "https://github.com/bearcove/vixen-mac-app/releases/download/v0.4.1/Vixen-0.4.1.dmg"
  name "Vixen"
  desc "A Rust build engine with correct caching"
  homepage "https://vixen.rs"

  depends_on macos: ">= :tahoe"

  app "Vixen.app"
end
