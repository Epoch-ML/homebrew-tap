# frozen_string_literal: true

# ZTC, a coding agent with its self-contained desktop runtime.
class Ztc < Formula
  desc "Coding agent with its self-contained desktop runtime"
  homepage "https://zergai.com/ztc"
  url "https://github.com/Epoch-ML/ztc-releases/releases/download/ztc-desktop-preview-v0.26.0-beta.1/ztc.app.tar.gz"
  version "0.26.0-beta.1"
  sha256 "75d4ef64f5c82f16d2fa60afa5c63b0e0a2e10f6ab44cfa3398c7e08383b29d6"
  depends_on arch: :arm64
  depends_on :macos

  def install
    app = buildpath/"ztc.app"
    app = buildpath unless app.directory?
    (libexec/"ztc.app").install app/"Contents"
    (bin/"ztc").write <<~SH
      #!/bin/sh
      exec '#{libexec}/ztc.app/Contents/MacOS/ZTerm' --ztc-cli "$@"
    SH
  end

  def caveats
    "Open #{libexec}/ztc.app for the desktop. Existing ~/.ztc profiles are shared."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ztc --version")
  end
end
