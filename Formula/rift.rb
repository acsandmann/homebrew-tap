class Rift < Formula
  desc "Tiling window manager for macOS"
  homepage "https://github.com/acsandmann/rift"
  version "0.0.1.1"
  url "https://github.com/acsandmann/rift/releases/download/v#{version}/rift-universal-macos-#{version}.tar.gz"
  sha256 "d245cbc6dae4c8dc21f628ad71e286192040480772842be4fda9f4046ed9c5bf"
  license "Apache-2.0"
  head "https://github.com/acsandmann/rift.git", branch: "main"

  def install
    bin.install "rift"
    bin.install "rift-cli"
  end

  #test do
  #  system "#{bin}/rift", "--version"
  #end
end
