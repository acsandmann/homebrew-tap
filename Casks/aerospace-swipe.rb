cask "aerospace-swipe" do
  version "0.0.4"
  sha256 "4a146ab8d0af067f6f6130ee2aa9fba9822b7e19a1107069805988a2afe1f7f7"

  url "https://github.com/acsandmann/aerospace-swipe/releases/download/v#{version}/AerospaceSwipe-#{version}.zip"
  name "Aerospace Swipe"
  desc "Trackpad gesture support for AeroSpace window manager"
  homepage "https://github.com/acsandmann/aerospace-swipe"

  app "AerospaceSwipe.app"

  postflight do
    launch_agent_plist = "#{Dir.home}/Library/LaunchAgents/com.acsandmann.swipe.plist"

    plist_content = <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>com.acsandmann.swipe</string>
        <key>ProgramArguments</key>
        <array>
          <string>/Applications/AerospaceSwipe.app/Contents/MacOS/AerospaceSwipe</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <true/>
      </dict>
      </plist>
EOS

    File.write(launch_agent_plist, plist_content)
    system "launchctl", "load", launch_agent_plist
  end

  uninstall_preflight do
    launch_agent_plist = "#{Dir.home}/Library/LaunchAgents/com.acsandmann.swipe.plist"
    if File.exist?(launch_agent_plist)
      system "launchctl", "unload", launch_agent_plist
      File.delete(launch_agent_plist)
    end
  end

  zap trash: [
    "~/Library/LaunchAgents/com.acsandmann.swipe.plist",
  ]
end
