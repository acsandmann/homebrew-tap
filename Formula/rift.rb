class Rift < Formula
  desc "Tiling window manager for macOS"
  homepage "https://github.com/acsandmann/rift"
  version "0.0.2"
  url "https://github.com/acsandmann/rift/releases/download/v#{version}/rift-universal-macos-#{version}.tar.gz"
  sha256 "7f15b079fd5c817c716dbb2e7668b88948b15481393cfd76fc139c156d579da5"
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
