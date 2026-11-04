class Ztc < Formula
  desc "Coding agent with its self-contained desktop runtime"
  homepage "https://zergai.com/ztc"
  url "https://github.com/Epoch-ML/ztc-releases/releases/download/ztc-desktop-preview-v0.9.0-beta.1/ztc.app.tar.gz"
  version "0.9.0-beta.1"
  sha256 "1c933b68cec479fa842c7e815afc32ffe60e12daf4d07b750206e1ddfb2737bf"
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
