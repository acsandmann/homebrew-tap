class Menuanywhere < Formula
  desc "the macos menu bar at your fingertips"
  homepage "https://github.com/acsandmann/menuanywhere"
  url "https://api.github.com/repos/acsandmann/menuanywhere/tarball/1.0.0"
  sha256 "f3e687bb74e65cae7236a790a027d6e2186c7308cb0f0cc6b6e6d0c5883f96be"
  version "1.0.0"
  license "MIT"

  depends_on xcode: ["12.0", :build]
  depends_on :macos

  def install
    system "swiftc", "-framework", "Cocoa", "-O", "menuanywhere.swift", "-o", "menuanywhere"
    bin.install "menuanywhere"
  end

  service do
    run [opt_bin/"menuanywhere"]
    keep_alive true
    log_path var/"log/menuanywhere.log"
    error_log_path var/"log/menuanywhere.error.log"
    working_dir HOMEBREW_PREFIX
  end

  test do
    assert_predicate bin/"menuanywhere", :exist?
    assert_predicate bin/"menuanywhere", :executable?
  end
end
