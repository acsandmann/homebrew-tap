class Rift < Formula
  desc "Tiling window manager for macOS"
  homepage "https://github.com/acsandmann/rift"
  version "0.0.3"
  url "https://github.com/acsandmann/rift/releases/download/v#{version}/rift-universal-macos-#{version}.tar.gz"
  sha256 "0f3896f124eab990fe937cb849ff534559dfb1aa03d9ed186bf7a1cf45711f2e"
  license "Apache-2.0"
  head "https://github.com/acsandmann/rift.git", branch: "main"

  def install
    bin.install "rift"
    bin.install "rift-cli"
  end

  def caveats
      <<~EOS
        Rift requires Accessibility permissions to control windows.
        Grant permissions in System Settings > Privacy & Security > Accessibility.

        To copy the example configuration:
          mkdir -p ~/.config/rift && cp #{pkgshare}/rift.default.toml ~/.config/rift/config.toml
      EOS
  end

  #test do
  #  system "#{bin}/rift", "--version"
  #end
end
