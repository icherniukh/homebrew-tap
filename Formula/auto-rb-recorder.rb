class AutoRbRecorder < Formula
  desc "Automatic Pioneer Rekordbox Session Audio Recorder"
  homepage "https://github.com/icherniukh/auto-rb-recorder"
  url "https://github.com/icherniukh/auto-rb-recorder/releases/download/v1.1.4-rc2/auto-rb-recorder-macos-universal.zip"
  sha256 "95d70378c27ae2a577fb9134af2f9e7b3de705b5c43e6441e3fd3031f8868afd"
  version "1.1.4-rc2"

  def install
    bin.install "auto-rb-recorder"
  end

  # Let Homebrew manage the background Daemon process instead of our brittle script!
  service do
    run [opt_bin/"auto-rb-recorder"]
    keep_alive true
    log_path var/"log/auto-rb-recorder.log"
    error_log_path var/"log/auto-rb-recorder.error.log"
  end

  def caveats
    <<~EOS
      macOS requires you to grant Screen Recording permissions to Core Audio Tap tools.
      
      When you first open Pioneer Rekordbox, macOS will prompt you to grant Screen Recording permission to auto-rb-recorder.
      You MUST grant this permission in System Settings -> Privacy & Security -> Screen Recording, or the daemon cannot intercept the audio!
    EOS
  end
end
