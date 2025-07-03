class Qlcodec < Formula
  desc "QLCodec makes “Quick Look“ play everything"
  homepage "https://github.com/Oil3/QLCodec"
  url "https://github.com/Oil3/QLCodec/releases/download/QLC-1.1-universalBinary/QLCodec.1.1-.UniversalBinary.zip"
  version "1.1"
  sha256 "49d4877031c3298d491f78d41fb9eba7d768ae35e9edcc698a33c2df2335acf4"

  def install
    # The zip file contains QLCodec.app.
    # This will install the .app bundle to the Homebrew prefix.
    prefix.install "QLCodec.app"
  end

  def post_install
    # According to the developer, the app needs to be launched to register the extension.
    ohai "To complete the installation, you must manually open QLCodec.app."
    puts "You can find it in: #{prefix}"
  end

  test do
    # A simple test to check if the app is installed.
    assert_predicate prefix/"QLCodec.app", :exist?
  end
end
