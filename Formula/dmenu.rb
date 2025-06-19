class Dmenu < Formula
  desc "Dynamic menu for macOS, inspired by dmenu for X11"
  homepage "https://github.com/acsandmann/dmenu"

  url "https://api.github.com/repos/acsandmann/dmenu/tarball/0.0.3"
  sha256 "38b9cd81e64ef2aacd2d8760181d6ea1f88896ea31d07a7a17d06a115bcff67a"
  license "MIT"
  head "https://github.com/acsandmann/dmenu.git", branch: "main"

  depends_on :xcode => :build

  def install
    system "make"
    bin.install "dmenu"
  end

  test do
    assert_predicate bin/"dmenu", :exist?
    assert_predicate bin/"dmenu", :executable?
  end
end
