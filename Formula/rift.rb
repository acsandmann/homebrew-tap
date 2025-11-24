class Rift < Formula
  desc "Tiling window manager for macOS"
  homepage "https://github.com/acsandmann/rift"
  version "0.2.5"
  url "https://github.com/acsandmann/rift/releases/download/v#{version}/rift-universal-macos-#{version}.tar.gz"
  sha256 "5e92a25e118c5676f9d1e24f4d55e8715d4d54c7ccf0448cefcf6b8b35ae6b08"
  license "Apache-2.0"
  head "https://github.com/acsandmann/rift.git", branch: "main"

  def install
    bin.install "rift"
    bin.install "rift-cli"

    system "codesign", "--force", "-s", "-", "#{bin}/rift"
    system "codesign", "--force", "-s", "-", "#{bin}/rift-cli"
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
