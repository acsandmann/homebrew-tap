class Rift < Formula
  desc "Tiling window manager for macOS"
  homepage "https://github.com/acsandmann/rift"
  version "0.0.4"
  url "https://github.com/acsandmann/rift/releases/download/v#{version}/rift-universal-macos-#{version}.tar.gz"
  sha256 "1c12ac57d1627ea7f81730df21f262c7710115f8b044609f1950a71af8b2e7a2"
  license "Apache-2.0"
  head "https://github.com/acsandmann/rift.git", branch: "main"

  def install
    bin.install "rift"
    bin.install "rift-cli"

    system "codesign", "--force", "-s", "-", "#{bin}/rift"
    system "codesign", "--force", "-s", "-", "#{bin}/rift-cli"
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
