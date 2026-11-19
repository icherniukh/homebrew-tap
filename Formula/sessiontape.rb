class Sessiontape < Formula
  desc "Automatic Pioneer Rekordbox session audio recorder"
  homepage "https://github.com/icherniukh/sessiontape"
  url "https://github.com/icherniukh/sessiontape/releases/download/v1.2.0/auto-rb-recorder-macos-universal.zip"
  sha256 "cd31f899f9d27beed4692797794b76c8fcea3b3614f1749d35e061a8cbc65dc2"
  license "GPL-3.0-or-later"

  conflicts_with "sessiontape-preview", because: "both install a `sessiontape` binary"

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
