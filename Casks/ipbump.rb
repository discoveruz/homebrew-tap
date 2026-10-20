cask "ipbump" do
  version "2.3.0"
  sha256 "84122ee06bf371824b9064436b90fd8dc64a8a764334602d9472cac550488914"

  url "https://github.com/discoveruz/IpBump/releases/download/v#{version}/IpBump-#{version}.pkg"
  name "IpBump"
  desc "Menu bar app that switches to a free local IPv4 address"
  homepage "https://github.com/discoveruz/IpBump"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  pkg "IpBump-#{version}.pkg"

  uninstall launchctl: [
              "io.github.discoveruz.ipbump",
              "io.github.discoveruz.ipbump.helper",
            ],
            quit:      "io.github.discoveruz.ipbump",
            pkgutil:   [
              "io.github.discoveruz.ipbump.app",
              "io.github.discoveruz.ipbump.helper",
            ],
            delete:    "/var/run/io.github.discoveruz.ipbump.v1.sock"

  zap trash: [
    "~/Library/Application Support/IpBump",
    "~/Library/Preferences/io.github.discoveruz.ipbump.plist",
  ]
end
