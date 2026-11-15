# ardhitama Homebrew tap

Homebrew casks for my Mac apps.

| Cask | Contents | Needs |
| --- | --- | --- |
| `fanmac` | FanMac, a menu bar app for temperatures and fan control, and its `fanmac` command | macOS 26.1 or later, Apple silicon or Intel |

## Install

```sh
brew trust --tap ardhitama/tap
brew tap ardhitama/tap
brew install --cask fanmac
```

Trust the tap first: Homebrew refuses casks from an untrusted tap.

## Release assets

This repository's releases hold the signed, notarized archives the casks
download:

- `fanmac-v<version>`: `fanmac-macos.tar.gz` and its `.sha256`.

`.github/workflows/release-attestation.yml` attests each archive when its
release is published, and each product's release waits for and verifies that
attestation before it publishes the cask.

Each product's release script writes its cask and assets here, publishing the
cask after the assets: FanMac's is `scripts/release.sh` in
[ardhitama/fanmac](https://github.com/ardhitama/fanmac). A cask's version and
checksum come from its release; never hand-edit them.
