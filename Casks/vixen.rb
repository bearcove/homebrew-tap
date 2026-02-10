cask "vixen" do
  version "0.2.0"
  sha256 "a6072f1dfea0f659e1448494e6b1d65fceed113989e737b48139638be5366205"

  url "https://github.com/bearcove/vixen-mac-app/releases/download/v#{version}/Vixen-#{version}.dmg"
  name "Vixen"
  desc "A Rust build engine with correct caching"
  homepage "https://vixen.rs"

  depends_on macos: ">= :tahoe"

  app "Vixen.app"
end
