# DoRePi C Version

![C](https://img.shields.io/badge/C-%23007ACC?style=for-the-badge&logo=c&logoColor=white)![Raspberry Pi](https://img.shields.io/badge/Raspberry%20Pi-A22846.svg?style=for-the-badge&logo=Raspberry-Pi&logoColor=white)![CMAKE](https://img.shields.io/badge/CMake-064F8C.svg?style=for-the-badge&logo=CMake&logoColor=white)![License](https://img.shields.io/github/license/Ledrac-UFCA/DoRePi?style=for-the-badge)

- [DoRePi C Version](#dorepi-c-version)
  - [Automatic Setup](#automatic-setup)
    - [Clone this Repository](#clone-this-repository)
  - [Manual Setup](#manual-setup)
    - [Clone this Repository](#clone-this-repository-1)
    - [Dependencies](#dependencies)
      - [Pop!\_OS/Linux Mint/Ubuntu](#pop_oslinux-mintubuntu)
      - [Fedora](#fedora)
      - [Arch Linux / CachyOS](#arch-linux--cachyos)
      - [NixOS](#nixos)
    - [Clone pico-sdk](#clone-pico-sdk)
    - [Add pico-sdk path](#add-pico-sdk-path)
      - [Bash and ZSH](#bash-and-zsh)
  - [Build](#build)

## Automatic Setup

### Clone this Repository

```shell
git clone -b final-version_c https://github.com/Ledrac-UFCA/DoRePi.git
```

Use [setup.sh](./setup.sh):

```shell
chmod +x setup.sh
./setup.sh
```

## Manual Setup

### Clone this Repository

```shell
git clone -b final-version_c https://github.com/Ledrac-UFCA/DoRePi.git
```

### Dependencies

#### Pop!_OS/Linux Mint/Ubuntu

```shell
sudo apt update
sudo apt install -y \
    cmake \
    gcc-arm-none-eabi \
    libnewlib-arm-none-eabi \
    libstdc++-arm-none-eabi-newlib \
    python3 \
    ninja \
    git
```

#### Fedora

```shell
sudo dnf install -y \
  cmake \
  gcc-arm-none-eabi \
  newlib-arm-none-eabi \
  libstdc++-arm-none-eabi \
  python3 \
  ninja \
  git
```

#### Arch Linux / CachyOS

```shell
sudo pacman -S --needed --noconfirm \
  cmake \
  arm-none-eabi-gcc \
  arm-none-eabi-newlib \
  arm-none-eabi-gcc-libs \
  python \
  ninja \
  git
```

#### NixOS

```shell
nix-env -iA nixpkgs.cmake \
            nixpkgs.gcc-arm-embedded \
            nixpkgs.newlib \
            nixpkgs.gnumake \
            nixpkgs.python3 \
            nixpkgs.ninja \
            nixpkgs.git
```

### Clone [pico-sdk](https://github.com/raspberrypi/pico-sdk)

```shell
git clone -b master https://github.com/raspberrypi/pico-sdk.git --recurse-submodules
```

### Add pico-sdk path

#### Bash and ZSH

In your .bashrc add this line at the final of file:

```bash
export PICO_SDK_PATH=PATH-TO-YOUR-PICO-SDK-DIR
```

## Build

Use [build.sh](./build.sh):
```shell
chmod +x build.sh
./build.sh
```

Or

```shell
mkdir build && cd build && cmake -G Ninja .. && ninja
```
