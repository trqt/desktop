# Multi-stage build
ARG FEDORA_MAJOR_VERSION=38

## Build desktop
FROM quay.io/fedora-ostree-desktops/sericea:${FEDORA_MAJOR_VERSION}
# See https://pagure.io/releng/issue/11047 for final location

COPY usr /usr

COPY setup-firstboot /usr/bin

RUN rpm-ostree override remove firefox firefox-langpacks && \
    rpm-ostree install distrobox fish flatpak-builder zenity doas gvfs-mtp && \
    rpm-ostree install jetbrains-mono-fonts ibm-plex-mono-fonts material-icons-fonts redhat-display-fonts redhat-text-fonts redhat-mono-fonts comic-neue-fonts && \
    rpm-ostree install virt-manager && \
    sed -i 's/#AutomaticUpdatePolicy.*/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf && \
    systemctl enable rpm-ostreed-automatic.timer && \
    ostree container commit
