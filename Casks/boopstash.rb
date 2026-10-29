# The cask served from lemehmet/homebrew-boopstash. This file is the template:
# the release workflow substitutes the underscore-fenced placeholders and
# pushes the result to the tap's Casks/, so a change to the cask is made here,
# never in the tap repository.
#
# The app it installs is signed with Developer ID, notarized and stapled by
# the same workflow (ADR 0004), so Gatekeeper opens it without prompting.
cask "boopstash" do
  version "0.3.0"
  sha256 "8521bc00f018c6dd337e0fc9f28817ba6e3bd31587593f19a544d772c4efccf4"

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
