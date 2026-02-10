cask "vixen" do
  version "0.4.0"
  sha256 "e0ae145bc9afa0e89527f37ac73a048a4a33cbf9d7637cc2e1b1b327155b98c0"

  url "https://github.com/bearcove/vixen-mac-app/releases/download/v0.4.0/Vixen-0.4.0.dmg"
  name "Vixen"
  desc "A Rust build engine with correct caching"
  homepage "https://vixen.rs"

  depends_on macos: ">= :tahoe"

  app "Vixen.app"
end
