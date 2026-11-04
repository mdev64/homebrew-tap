cask "si-type" do
  version "1.0.0"
  sha256 "4c6f006bd66c1cf32548ee24387e895b1667c8e46f1fb2fa40c1391796ec1ae3"

  url "https://github.com/mdev64/si-type/releases/download/v#{version}/SiType-v#{version}.zip"
  name "SiType"
  desc "Sinhala Phonetic (Singlish) and Wijesekara input method"
  homepage "https://github.com/mdev64/si-type"

  depends_on macos: ">= :big_sur"

  input_method "SiType.app"

  postflight do
    app = "#{Dir.home}/Library/Input Methods/SiType.app"
    # The app is ad-hoc signed, not notarized: clear quarantine so macOS will load it.
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", app]
    system_command "#{app}/Contents/MacOS/SiType", args: ["--register"]
  end

  uninstall quit: "com.sitype.inputmethod.SiType"

  zap trash: "~/Library/Preferences/com.sitype.inputmethod.SiType.plist"

  caveats <<~EOS
    Enable SiType in System Settings → Keyboard → Input Sources → Edit → + → Sinhala.
    If it does not appear, log out and back in.
  EOS
end
