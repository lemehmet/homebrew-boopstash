# The cask served from lemehmet/homebrew-boopstash. This file is the template:
# the release workflow substitutes the underscore-fenced placeholders and
# pushes the result to the tap's Casks/, so a change to the cask is made here,
# never in the tap repository.
#
# The app it installs is signed with Developer ID, notarized and stapled by
# the same workflow (ADR 0004), so Gatekeeper opens it without prompting.
cask "boopstash" do
  version "0.2.0"
  sha256 "e3cc09a26480c3be12dd5173984e77d65c864ec1a885947546fc97f3c8ee905a"

  url "https://github.com/lemehmet/boopstash/releases/download/v#{version}/BoopStash-#{version}.zip"
  name "BoopStash"
  desc "Scratch pad that keeps what you paste: searchable, private, on-device"
  homepage "https://github.com/lemehmet/boopstash"

  depends_on macos: :tahoe

  app "BoopStash.app"

  # The sandbox keeps everything in the app's container.
  zap trash: [
    "~/Library/Application Scripts/com.lemehmet.boopstash",
    "~/Library/Containers/com.lemehmet.boopstash",
  ]
end
