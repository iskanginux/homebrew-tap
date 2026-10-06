cask "meetiline" do
  version "0.3.8"
  sha256 "7afe8859eb02d0166e86d83117276e268e900c18fd3e6d8e986f612f9da73b1f"

  url "https://github.com/iskanginux/meetiline-site/releases/download/v#{version}/Meetiline.dmg"
  name "Meetiline"
  desc "Turns a meeting recording into screenshots and a transcript for any AI"
  homepage "https://meetiline.iskan.kz/"

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "Meetiline.app"

  # Meetiline is not notarized yet: without this macOS would refuse to open it the first time.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Meetiline.app"]
  end

  # Projects in ~/Movies/Meetiline are the person's own files and are never removed.
  zap trash: [
    "~/Library/Application Support/Meetiline",
    "~/Library/Preferences/app.meetiline.mac.plist",
  ]
end
