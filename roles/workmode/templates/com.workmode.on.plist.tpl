<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
    <dict>
        <key>Label</key>
        <string>com.workmode.on</string>
        <key>ProgramArguments</key>
        <array>
            <string>{{ workmode_path }}</string>
            <string>on</string>
            <string>{{ workmode_denyfile_path }}</string>
            <string>/etc/hosts</string>
        </array>
        <key>StartCalendarInterval</key>
        <dict>
            <key>Minute</key>
            <integer>15</integer>
        </dict>
    </dict>
</plist>
