class Rift < Formula
  desc "Tiling window manager for macOS"
  homepage "https://github.com/acsandmann/rift"
  url "https://github.com/acsandmann/rift/releases/download/v0.6.3/rift-universal-macos-0.6.3.tar.gz"
  version "0.6.3"
  sha256 "8a15c668d24b80457ca7f8ae27d9074595c72bd050812724fab7844fae28e8eb"
  license "Apache-2.0"
  head "https://github.com/acsandmann/rift.git", branch: "main"

  def install
    bin.install "rift"
    bin.install "rift-cli"
    pkgshare.install "rift.default.toml"

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
