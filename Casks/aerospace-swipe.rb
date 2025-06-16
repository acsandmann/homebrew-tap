cask "aerospace-swipe" do
  version "0.0.5"
  sha256 "dee32ec70b9b236fff654a8686b61b1d74660813bca41070b06cbbf055beb3da"

  url "https://github.com/acsandmann/aerospace-swipe/releases/download/v#{version}/AerospaceSwipe-#{version}.zip"
  name "aerospace-swipe"
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
