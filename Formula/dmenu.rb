class dmenu < Formula
  desc "Dynamic menu for macOS, inspired by dmenu for X11"
  homepage "https://github.com/acsandmann/dmenu"

  url "https://github.com/acsandmann/dmenu/archive/refs/tags/v5.0.tar.gz"
  sha256 "f22f29396349d3283f1797c385b23a9d978a3f81e6b91eb63683f8475c43d56f"
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
