# My Fedora Immutable Desktop

[![build-desktop](https://github.com/tqrt/desktop/actions/workflows/build.yml/badge.svg)](https://github.com/trqt/desktop/actions/workflows/build.yml)

A Fedora Sericea customized image.

## Usage

Warning: This is an experimental feature and should not be used in production (yet), however it's pretty close) Depending on the version of rpm-ostree on your system you might need to pass an additional `--experimental` flag

To rebase an existing Silverblue/Kinoite machine to the latest release (38): 

    sudo rpm-ostree rebase ostree-unverified-registry:ghcr.io/trqt/desktop:38
    
We build date tags as well, so if you want to rebase to a particular day's release:
  
    sudo rpm-ostree rebase ostree-unverified-registry:ghcr.io/trqt/desktop:20230214 

The `latest` tag will automatically point to the latest build. Note that when a new version of Fedora is released that the `latest` tag will get updated to that latest release automatically. 

## Verification

These images are signed with sisgstore's [cosign](https://docs.sigstore.dev/cosign/overview/). You can verify the signature by downloading the `cosign.pub` key from this repo and running the following command:

    cosign verify --key cosign.pub ghcr.io/trqt/desktop
