cask "masv-agent" do
  version "0.0.0"
  sha256 "xyz"

  url "https://dl.masvinternal.com/agent/masv-agent-macos-amd64-#{version}.zip"
  name "masv-agent"
  desc "masv-agent"
  homepage "https://developer.massive.io/transfer-agent/"

  # livecheck do
  #   url "https://dl.massive.io/agent/latest.json"
  #   strategy :json do |json|
  #     json["version"]
  #   end
  # end

  installer script: {
    executable: "launchd_install.sh",
    args:       ["#{staged_path}"],
  }

  uninstall script: {
    executable: "launchd_uninstall.sh",
    sudo:       false
  }

  binary "masv-agent-macos-amd64-#{version}", target: "masv-agent"
end
