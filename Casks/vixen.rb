cask "vixen" do
  version "0.1.0"
  sha256 "a63300e4dadf29f9e5a92538531f3e5473c008dfa210815aa0c632e7501612ea"

  url "https://github.com/bearcove/vixen-mac-app/releases/download/v#{version}/Vixen-#{version}.dmg"
  name "Vixen"
  desc "A Rust build engine with correct caching"
  homepage "https://vixen.rs"

  depends_on macos: ">= :tahoe"

  app "Vixen.app"
end
