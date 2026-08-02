#!/usr/bin/env bash

apt update && apt upgrade -y

# installing requirements
apt install -y python \
    python-pip \
    python-numpy \
    build-essential \
    cmake \
    ninja \
    libopenblas \
    libandroid-execinfo \
    patchelf \
    binutils


# same basic python pkgs 
pip install --upgrade setuptools \
    wheel \
    packaging \
    pyproject_metadata \
    cython \
    meson-python \
    versioneer


# Getting python version for build
PYVER=$(python3 -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')


# installing pandas 
MAKEFLAGS="-j$(nproc)" \
LDFLAGS="-lpython$PYVER" \
pip install --no-build-isolation --no-cache-dir pandas

# installing requrements
pip install -r requirements.txt
