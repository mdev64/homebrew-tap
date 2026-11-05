class ShellSage < Formula
  desc "An offline AI CLI assistant for Apple Silicon Macs"
  homepage "https://github.com/mdev64/shell-sage"
  version "1.0.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/mdev64/shell-sage/releases/download/v1.0.1/sage-v1.0.1-aarch64-apple-darwin.tar.gz"
    sha256 "61bfce844faa6703719338913c8cdd2045f48d661a0e7ba4055d581fb016be5d"
  end

  def install
    bin.install "sage"
  end

  test do
    system "#{bin}/sage", "--help"
  end
end
