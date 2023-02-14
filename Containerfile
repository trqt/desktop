# Multi-stage build
ARG FEDORA_MAJOR_VERSION=38

## Build desktop
FROM quay.io/fedora-ostree-desktops/sericea:${FEDORA_MAJOR_VERSION}
# See https://pagure.io/releng/issue/11047 for final location

COPY etc /etc

COPY ublue-firstboot /usr/bin

RUN rpm-ostree override remove firefox firefox-langpacks && \
    rpm-ostree install distrobox fish flatpak-builder zenity dnscrypt-proxy tor doas && \
    sed -i 's/#AutomaticUpdatePolicy.*/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf && \
    systemctl enable rpm-ostreed-automatic.timer && \
    systemctl enable flatpak-automatic.timer && \
    systemctl enable tor.service && \
    ostree container commit
