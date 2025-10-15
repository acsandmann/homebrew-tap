class Rift < Formula
  desc "Tiling window manager for macOS"
  homepage "https://github.com/acsandmann/rift"
  version "0.0.0"
  url "https://github.com/acsandmann/rift/releases/download/v#{version}/rift-universal-macos-#{version}.tar.gz"
  sha256 "REPLACED_BY_ACTION"
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
