class ShellSage < Formula
  desc "An offline AI CLI assistant for Apple Silicon Macs"
  homepage "https://github.com/mdev64/shell-sage"
  version "1.0.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/mdev64/shell-sage/releases/download/v1.0.0/sage-v1.0.0-aarch64-apple-darwin.tar.gz"
    sha256 "45a94aed21291b8aa969bec1213d192dfed460c5d87f5d29debd386d571ec89e"
  end

  def install
    bin.install "sage"
  end

  test do
    system "#{bin}/sage", "--help"
  end
end
