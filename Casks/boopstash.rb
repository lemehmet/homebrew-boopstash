# The cask served from lemehmet/homebrew-boopstash. This file is the template:
# the release workflow substitutes the underscore-fenced placeholders and
# pushes the result to the tap's Casks/, so a change to the cask is made here,
# never in the tap repository.
#
# The app it installs is signed with Developer ID, notarized and stapled by
# the same workflow (ADR 0004), so Gatekeeper opens it without prompting.
cask "boopstash" do
  version "0.5.0"
  sha256 "a1523151fb8d7c78244c977de7b6fd20a47a012243866d44c6ccff5087742f53"

  url "https://github.com/lemehmet/boopstash/releases/download/v#{version}/BoopStash-#{version}.zip"
  name "BoopStash"
  desc "Scratch pad that keeps what you paste: searchable, private, on-device"
  homepage "https://github.com/lemehmet/boopstash"

  depends_on macos: :tahoe

  app "BoopStash.app"
  # The sandboxed command (ADR 0009): `some-command | boopstash`.
  binary "#{appdir}/BoopStash.app/Contents/Helpers/boopstash"

  # The sandbox keeps everything in the containers: the app's, the
  # command's, and the App Group's, which holds the notes.
  zap trash: [
    "~/Library/Application Scripts/com.lemehmet.boopstash",
    "~/Library/Application Scripts/com.lemehmet.boopstash.cli",
    "~/Library/Containers/com.lemehmet.boopstash",
    "~/Library/Containers/com.lemehmet.boopstash.cli",
    "~/Library/Group Containers/A658882T2K.com.lemehmet.boopstash",
  ]
end
