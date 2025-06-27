class Dmenu < Formula
  desc "Dynamic menu for macOS, inspired by dmenu for X11"
  homepage "https://github.com/acsandmann/dmenu"

  url "https://api.github.com/repos/acsandmann/dmenu/tarball/0.0.7"
  sha256 "4cd303b5144683269d58ff3108dfaed4f09df92519fc8d95f329ef577a78f24a"
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
