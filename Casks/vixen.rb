cask "vixen" do
  version "0.3.1"
  sha256 "f71fca32773d6268f7144887b462d9b8e9737bedbd45bc0cb80e7f6df0a823c7"

  url "https://github.com/bearcove/vixen-mac-app/releases/download/v#{version}/Vixen-#{version}.dmg"
  name "Vixen"
  desc "A Rust build engine with correct caching"
  homepage "https://vixen.rs"

  depends_on macos: ">= :tahoe"

  app "Vixen.app"
end
