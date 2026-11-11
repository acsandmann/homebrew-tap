class Rift < Formula
  desc "Tiling window manager for macOS"
  homepage "https://github.com/acsandmann/rift"
  url "https://github.com/acsandmann/rift/releases/download/v0.8.1/rift-universal-macos-0.8.1.tar.gz"
  version "0.8.1"
  sha256 "3c6b59229419d2bb395ae090ce893aaab12aeeea964c8b8085d1b01a00f5c4e3"
  revision 1
  license "Apache-2.0"
  head "https://github.com/acsandmann/rift.git", branch: "main"

  def install
    bin.install "rift"
    bin.install "rift-cli"
    pkgshare.install "rift.default.toml"
  end

  def caveats
      <<~EOS
        Rift requires Accessibility permissions to control windows.
        Grant permissions in System Settings > Privacy & Security > Accessibility.

        To copy the example configuration:
          mkdir -p ~/.config/rift && cp #{pkgshare}/rift.default.toml ~/.config/rift/config.toml
      EOS
  end

  service do
    run "#{opt_bin}/rift"
    environment_variables PATH: std_service_path_env, LANG: "en_US.UTF-8"
    keep_alive true
    process_type :interactive
    require "etc"
    user = (Etc.getpwuid(Process.uid).name rescue "unknown")
    log_path "/tmp/rift_#{user}.out.log"
    error_log_path "/tmp/rift_#{user}.err.log"
  end

  #test do
  #  system "#{bin}/rift", "--version"
  #end
end
