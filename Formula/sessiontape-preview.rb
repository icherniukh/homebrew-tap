class SessiontapePreview < Formula
  desc "Automatic Pioneer Rekordbox session audio recorder (preview track)"
  homepage "https://github.com/icherniukh/sessiontape"
  url "https://github.com/icherniukh/sessiontape/releases/download/v1.3.1-rc1/sessiontape-macos-universal.zip"
  sha256 "16f120248b04de4e29e786819fde65eba46cf6060ee102c546c7fc816beea4bd"
  license "GPL-3.0-or-later"

  conflicts_with "sessiontape", because: "both install a `sessiontape` binary"

  def install
    if File.exist?("sessiontape")
      bin.install "sessiontape"
    else
      bin.install "auto-rb-recorder" => "sessiontape"
    end
  end

  service do
    run [opt_bin/"sessiontape"]
    keep_alive true
    log_path var/"log/sessiontape.log"
    error_log_path var/"log/sessiontape.error.log"
  end

  def caveats
    <<~EOS
      Open Pioneer Rekordbox to trigger the macOS permission prompt for sessiontape:
      - Audio Recording permission for the default CoreAudio process tap backend
      - Screen Recording permission for the ScreenCaptureKit fallback backend

      Grant permission under System Settings -> Privacy & Security -> Screen & System Audio Recording.
    EOS
  end

  test do
    assert_path_exists bin/"sessiontape"
  end
end
