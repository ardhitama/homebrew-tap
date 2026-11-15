cask "fanmac" do
  version "0.2.0"
  sha256 "73d57527b5fadc1501960584fbf717d751a7e4fcdeb5b821381699afc444d8ca"

  url "https://github.com/ardhitama/homebrew-tap/releases/download/fanmac-v#{version}/fanmac-macos.tar.gz"
  name "FanMac"
  desc "Monitor temperatures and control fan speeds from the menu bar"
  homepage "https://github.com/ardhitama/fanmac"

  depends_on macos: :tahoe

  app "FanMac.app"
  binary "FanMac.app/Contents/Helpers/fanmac"

  uninstall quit: "com.ardhitama.fanmac.app"

  zap delete: [
        "/etc/sudoers.d/smc-fan-helper",
        "/Library/PrivilegedHelperTools/fanmac-smc-helper",
        "/usr/local/bin/fanmac",
      ],
      trash:  [
        "~/Library/Application Support/FanMac",
        "~/Library/Preferences/com.ardhitama.fanmac.app.plist",
        "~/Library/Preferences/tests.fan.plist",
      ]

  caveats <<~EOS
    FanMac changes fan speeds through a helper that runs as root. Open FanMac
    and click Install Helper once; it asks for an administrator password.
    To remove the helper and its sudoers rule with the app, run:
      brew uninstall --zap --cask fanmac
  EOS
end
