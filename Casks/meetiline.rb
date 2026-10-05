cask "meetiline" do
  version "0.3.5"
  sha256 "e73bf7c58f10f4660c70df608ffae1a671783b84e9e03126afdb50ac31f7df71"

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
