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
  end

  def post_install
    config_path = "#{Dir.home}/.config/rift/config.toml"
    return if File.exist?(config_path)

    config_dir = "#{Dir.home}/.config/rift"
    FileUtils.mkdir_p(config_dir)

    resource("default-config").stage do
      FileUtils.cp("rift.default.toml", config_path)
    end
  end

  resource "default-config" do
    url "https://github.com/acsandmann/rift/archive/refs/tags/v#{version}.tar.gz"
    sha256 "fd284fee51d82486b4273a2f489d518de6ef11c11f99d3ab8a61d148cc325bbd"
  end

  def caveats
    <<~EOS
      Rift requires Accessibility permissions to control windows.
      Grant permissions in System Settings > Privacy & Security > Accessibility.
    EOS
  end

  test do
    system "#{bin}/rift", "--version"
  end
end
  
