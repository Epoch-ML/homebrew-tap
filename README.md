# ZTC Homebrew tap

This tap will install the self-contained, signed ZTC Apple Silicon macOS app.
No formula is activated until a real notarized archive has been published by
[ztc-releases](https://github.com/Epoch-ML/ztc-releases).

The first release uses the preview channel. A formula must pin the archive URL
and SHA-256 from the verified immutable release catalog, embed no credentials,
and use the bundled Node runtime. It must pass `brew install --build-from-source`
and `brew test` on Apple Silicon before the catalog is activated.

Release owners generate `Formula/ztc.rb` with the publisher's
`scripts/write-homebrew-formula.mjs VERIFIED_RELEASE.json Formula/ztc.rb`.
The publisher checks exact formula parity before exposing `release.json`.
Existing `Epoch-ML/zterm-releases` feeds are unchanged.
