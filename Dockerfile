FROM archlinux:base-devel
RUN pacman -Syyu --noconfirm git wget cpio unzip rsync bc python3
RUN useradd -m -s /bin/bash builder
USER builder
WORKDIR /home/builder
RUN git clone --recursive https://github.com/nooploop/piejam_os.git
