class ShellSage < Formula
  desc "An offline AI CLI assistant for Apple Silicon Macs"
  homepage "https://github.com/mdev64/shell-sage"
  version "0.1.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/mdev64/shell-sage/releases/download/v0.1.0/sage-v0.1.0-aarch64-apple-darwin.tar.gz"
    sha256 "83b6a222839415d32d0e7b82ced284d6611c99e769fb118c2da7d8f839a92c15"
  end

  def install
    bin.install "sage"
  end

  test do
    system "#{bin}/sage", "--help"
  end
end
