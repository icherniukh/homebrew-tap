class AutoRbRecorder < Formula
  desc "Automatic Pioneer Rekordbox Session Audio Recorder"
  homepage "https://github.com/icherniukh/auto-rb-recorder"
  url "https://github.com/icherniukh/auto-rb-recorder/releases/download/v1.1.3/auto-rb-recorder-macos-universal.zip"
  sha256 "f70344b1deeda623da823cd80639506fdc9a440c880765bebbe245a089f04d9f"
  version "1.1.3"

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
