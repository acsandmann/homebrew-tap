class Menuanywhere < Formula
  desc "the macos menu bar at your fingertips"
  homepage "https://github.com/acsandmann/menuanywhere"
  url "https://api.github.com/repos/acsandmann/menuanywhere/tarball/1.0.2"
  sha256 "47b82743b2930610b45538cbeca5a9f0b016cb5e7c8b802482955490ed4c5ebb"
  version "1.0.2"
  license "MIT"

  depends_on xcode: ["12.0", :build]
  depends_on :macos

  def install
    system "make", "menuanywhere"
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
