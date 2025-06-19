class Menuanywhere < Formula
  desc "macos menu bar at your fingertips"
  homepage "https://github.com/acsandmann/menuanywhere"
  url "https://api.github.com/repos/acsandmann/menuanywhere/tarball/v1.0.0"
  sha256 "020005bfed6ccce3ea461cf2b5c2b20d8277b48499a5394b904afe9593cabd0b"
  version "v1.0.0"
  license "MIT"

  depends_on xcode: ["12.0", :build]
  depends_on :macos

  def install
    system "swiftc", "-framework", "Cocoa", "-O", "menuanywhere.swift", "-o", "menuanywhere"
    bin.install "menuanywhere"
  end

  test do
    assert_predicate bin/"menuanywhere", :exist?
    assert_predicate bin/"menuanywhere", :executable?
  end
end
