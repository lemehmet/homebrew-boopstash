# The cask served from lemehmet/homebrew-boopstash. This file is the template:
# the release workflow substitutes the underscore-fenced placeholders and
# pushes the result to the tap's Casks/, so a change to the cask is made here,
# never in the tap repository.
#
# The app it installs is signed with Developer ID, notarized and stapled by
# the same workflow (ADR 0004), so Gatekeeper opens it without prompting.
cask "boopstash" do
  version "0.4.4"
  sha256 "9a1b8454b5e5f735609dc5d53aa0ced62dd0c378d4f2b9434668cc6ff2e1e9ed"

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
