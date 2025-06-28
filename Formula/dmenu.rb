class Dmenu < Formula
  desc "Dynamic menu for macOS, inspired by dmenu for X11"
  homepage "https://github.com/acsandmann/dmenu"

  url "https://api.github.com/repos/acsandmann/dmenu/tarball/0.0.9"
  sha256 "3177200adf22d9bf15b901a0f01d665cfc332d564ce702824160f506d43c6153"
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
