#!/bin/bash

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")") && pwd"

if [ -z "$PICO_SDK_PATH"]; then
    echo "Error: PICO_SDK_PATH is not set. Please add it to your .bashrc or .zshrc."
    exit 1
fi

mkdir -p build
cd build
cmake ..
make
cd ..

echo "DoRePi.bin Generated"
echo "DoRePi.dis Generated"
echo "DoRePi.elf Generated"
echo "DoRePi.elf.map Generated"
echo "DoRePi.hex Generated"
echo "DoRePi.uf2 Generated"