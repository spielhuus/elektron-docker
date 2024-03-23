FROM archlinux:base-devel

ENV WORKSPACE="/github/workspace"
ENV WWW_DIR="/github/workspace/www"

RUN pacman -Syu --noconfirm \
  neovim kicad kicad-library python-pip git \
  base-devel clang \
  arm-none-eabi-gdb \
  arm-none-eabi-newlib \
  arm-none-eabi-gcc \
  dfu-util openocd bear \
  hugo

RUN python -m venv /opt/venv && \
    source /opt/venv/bin/activate && \
    pip install --upgrade pip && \
    pip3 install \
      matplotlib \
      numpy \
      pytest \
      pytest-json \
      sympy \
      scipy \
      pdoc \
      elektron-rs

RUN ln -s /usr/lib/python3.11/site-packages/pcbnew.py \
  /opt/venv/lib/python3.11/site-packages/pcbnew.py
RUN ln -s /usr/lib/python3.11/site-packages/_pcbnew.so \
  /opt/venv/lib/python3.11/site-packages/_pcbnew.so

RUN \
  mkdir -p /usr/local/share/fonts/TT/ && \
  curl -L "https://github.com/hikikomori82/osifont/blob/master/osifont-lgpl3fe.ttf?raw=true" -o /usr/local/share/fonts/TT/osifont-lgpl3fe.ttf

# Setup an entrypoint script
COPY entrypoint.sh /entrypoint.sh
COPY entrypoint-user.sh /entrypoint-user.sh
RUN chmod 755 /entrypoint.sh
RUN chmod 755 /entrypoint-user.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["/bin/bash"]
