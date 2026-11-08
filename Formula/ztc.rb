class Ztc < Formula
  desc "Coding agent with its self-contained desktop runtime"
  homepage "https://zergai.com/ztc"
  url "https://github.com/Epoch-ML/ztc-releases/releases/download/ztc-desktop-preview-v0.13.0-beta.1/ztc.app.tar.gz"
  version "0.13.0-beta.1"
  sha256 "80065f19bf17a69c1d1b39de0457ab5786b6f9d40a2a2e2a10dae6d8982b6bd4"
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
