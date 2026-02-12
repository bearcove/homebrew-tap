cask "vixen" do
  version "0.6.0"
  sha256 "3a144a7a914cb7889fb9249e66c4a645cbd1dab2daa8e05bb937f866c36343a7"

  url "https://github.com/bearcove/vixen-mac-app/releases/download/v0.6.0/Vixen-0.6.0.dmg"
  name "Vixen"
  desc "A Rust build engine with correct caching"
  homepage "https://vixen.rs"

  depends_on macos: ">= :tahoe"

  app "Vixen.app"
end
