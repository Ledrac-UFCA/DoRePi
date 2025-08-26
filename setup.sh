#!/bin/bash

PICO_SDK_DIR="$HOME/pico-sdk"

if [ -f /etc/os-release ]; then
    . /etc/os-release
    DISTRO=$ID
else
    echo "Cannot detect Linux distribution."
    exit 1
fi

case "$DISTRO" in
    ubuntu|linuxmint|pop)
        sudo apt update
        sudo apt install -y \
            cmake \
            gcc-arm-none-eabi \
            libnewlib-arm-none-eabi \
            libstdc++-arm-none-eabi-newlib \
            python3 \
            python3-pip \
            ninja \
            git
    ;;
    fedora)
        sudo dnf install -y \
            cmake \
            gcc-arm-none-eabi \
            newlib-arm-none-eabi \
            libstdc++-arm-none-eabi \
            python3 \
            python3-pip \
            ninja \
            git
    ;;
    arch|cachyos)
        sudo pacman -S --needed --noconfirm \
            cmake \
            arm-none-eabi-gcc \
            arm-none-eabi-newlib \
            arm-none-eabi-gcc-libs \
            python \
            python-pip \
            ninja \
            git
    ;;
    nixos)
        nix-env -iA nixpkgs.cmake \
                    nixpkgs.gcc-arm-embedded \
                    nixpkgs.newlib \
                    nixpkgs.gnumake \
                    nixpkgs.python3 \
                    nixpkgs.python3Packages.pip \
                    nixpkgs.ninja \
                    nixpkgs.git
    ;;
esac

if [ -z "$PICO_SDK_PATH" ]; then
    if [ ! -d "$HOME/pico-sdk" ]; then
        git clone -b master https://github.com/raspberrypi/pico-sdk.git --recurse-submodules "$HOME/pico-sdk"
        echo "pico-sdk cloned to $PICO_SDK_DIR"
    else
        echo "pico-sdk already exists at $PICO_SDK_DIR"
    fi
    echo "export PICO_SDK_PATH=$PICO_SDK_DIR" >> "$HOME/.bashrc"
    source "$HOME/.bashrc"
fi

if [ -d "$HOME/pico-sdk" ]; then
    PROJECT_DIR=$(pwd)
    cd "$HOME/pico-sdk"
    git pull
    git submodule update --init
    cd "$PROJECT_DIR"
fi