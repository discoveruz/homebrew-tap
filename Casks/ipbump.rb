cask "ipbump" do
  version "2.3.1"
  sha256 "d5bc3f83f58f1cc300fbbd61313dfb55eed83b8ce554aa70e6e2368a064a737f"

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
