class dmenu < Formula
  desc "Dynamic menu for macOS, inspired by dmenu for X11"
  homepage "https://github.com/acsandmann/dmenu"

  url "https://api.github.com/repos/acsandmann/dmenu/tarball/0.0.1"
  sha256 "844229fb57aeed54838a825686e55f677358328aafa6ed5c7c905c841da33c08"
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
