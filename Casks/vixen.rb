cask "vixen" do
  version "0.3.0"
  sha256 "e0b83c0bac11e03b819d0de7c74744818b8f8cb007d358b7b811461008e26e79"

  url "https://github.com/bearcove/vixen-mac-app/releases/download/v#{version}/Vixen-#{version}.dmg"
  name "Vixen"
  desc "A Rust build engine with correct caching"
  homepage "https://vixen.rs"

  depends_on macos: ">= :tahoe"

  app "Vixen.app"
end
