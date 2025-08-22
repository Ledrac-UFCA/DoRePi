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
            make \
            python3 \
            git
    ;;
    fedora)
        sudo dnf install -y \
            cmake \
            gcc-arm-none-eabi \
            newlib-arm-none-eabi \
            libstdc++-arm-none-eabi \
            make \
            python3 \
            git
    ;;
    arch|cachyos)
        sudo pacman -S --needed --noconfirm \
            cmake \
            arm-none-eabi-gcc \
            arm-none-eabi-newlib \
            make \
            python \
            git
    ;;
    nixos)
        nix-env -iA nixpkgs.cmake \
                    nixpkgs.gcc-arm-embedded \
                    nixpkgs.newlib \
                    nixpkgs.gnumake \
                    nixpkgs.python3 \
                    nixpkgs.git
    ;;
esac

if [ -z "$PICO_SDK_PATH" ]; then
    if [ ! -d "./pico-sdk" ]; then
        git clone -b master https://github.com/raspberrypi/pico-sdk.git --recurse-submodules ~/pico-sdk
        echo "pico-sdk cloned to $PICO_SDK_DIR"
    else
        echo "pico-sdk already exists at $PICO_SDK_DIR"
    fi
    export PICO_SDK_PATH=$PICO_SDK_DIR
    echo "PICO_SDK_PATH set to $PICO_SDK_PATH"
fi
