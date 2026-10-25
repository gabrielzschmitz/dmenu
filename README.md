# dmenu

<img align="right" width="192px" src="./dmenu.svg" alt="dmenu Logo">

<a href="./LICENSE"><img src="https://img.shields.io/badge/license-MIT-green" alt="License"></a>
<a href="https://www.buymeacoffee.com/gabrielzschmitz" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 20px !important;width: 87px;" ></a>
<a href="https://github.com/gabrielzschmitz/dmenu"><img src="https://img.shields.io/github/stars/gabrielzschmitz/dmenu?style=social" alt="Give me a Star"></a>

dmenu (dynamic menu) is a lightweight and efficient menu for X, commonly used
to launch applications or select items from a list. This package provides a
custom build maintained by
[gabrielzschmitz](https://github.com/gabrielzschmitz), incorporating patches
and configuration changes.

---

## Features

- Minimal and lightweight dynamic menu
- Fast startup and low resource usage
- Fuzzy matching and highlighting
- Centered window with configurable padding
- Adjustable line height and layout
- Mouse support, including motion events
- Match numbering for quick selection
- Password input mode for sensitive entries
- Managed window support
- Xresources support for dynamic configuration
- Nix flake, Nix package, and development shell included

---

## Build & Install

<details open>
<summary><b>With Make</b></summary>

```sh
cd src/
make
sudo make install
```

</details>

<details>
<summary><b>With Nix flakes</b></summary>

Build the package and enter the development shell:

```sh
nix build
nix develop
```

**Install on NixOS**

Add the flake input:

```nix
inputs.dmenu.url = "github:gabrielzschmitz/dmenu";
```

Add the package to your NixOS configuration:

```nix
environment.systemPackages = [
  inputs.dmenu.packages.${pkgs.system}.default
];
```

Rebuild:

```sh
sudo nixos-rebuild switch --flake .#nixos
```

</details>

<details>
<summary><b>With Nix (`default.nix`)</b></summary>

Build the package:

```sh
nix-build -A dmenu
```

**Install on NixOS**

```nix
environment.systemPackages = [
  (pkgs.callPackage /path/to/dmenu/default.nix {})
];
```

Replace `/path/to/dmenu` with the path to your local clone, then rebuild:

```sh
sudo nixos-rebuild switch
```

</details>

---

## Patches

This build includes the following patches:

- [center](https://tools.suckless.org/dmenu/patches/center/)
- [dmenu padding](https://tools.suckless.org/dmenu/patches/dmenupadding/)
- [fuzzy highlight](https://tools.suckless.org/dmenu/patches/fuzzyhighlight/)
- [fuzzy match](https://tools.suckless.org/dmenu/patches/fuzzymatch/)
- [line height](https://tools.suckless.org/dmenu/patches/line-height/)
- [lines below prompt and full width](https://tools.suckless.org/dmenu/patches/lines-below-prompt/)
- [managed](https://tools.suckless.org/dmenu/patches/managed/)
- [mouse support and motion](https://tools.suckless.org/dmenu/patches/mouse-support/)
- [numbers](https://tools.suckless.org/dmenu/patches/numbers)
- [password](https://tools.suckless.org/dmenu/patches/password)
- [Xresources](https://tools.suckless.org/dmenu/patches/xresources)

All patch files are available in [`src/patches/`](./src/patches/).

---

## Configuration

The program can be customized through `src/config.def.h` and `src/config.mk`.

After changing the configuration, rebuild the terminal:

```sh
cd src/
make clean
make
```

### Xresources (`xrdb`)

The Xresources patch allows supported program settings to be configured
through Xresources instead of hardcoding them in `config.def.h`.

Add your preferred settings to `~/.Xresources`, for example:

```xresources
! Dmenu options
dmenu.font:          SFMono Nerd Font:antialias=true:autohint=true:pixelsize=20
! dmenu.prompt:        PROMPT
dmenu.topbar:        1
dmenu.lines:         8

! Dmenu colors
dmenu.background:    #14171c
dmenu.foreground:    #abb2bf
dmenu.backgroundSel: #61afef
dmenu.foregroundSel: #14171c
dmenu.backgroundOut: #56b6c2
dmenu.foregroundOut: #181b21
dmenu.backgroundNormHighlight: #14171c
dmenu.foregroundNormHighlight: #d19a66
dmenu.backgroundSelHighlight:  #61afef
dmenu.foregroundSelHighlight:  #d19a66
```

Load the settings with `xrdb`:

```sh
xrdb -merge ~/.Xresources
```

---

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE)
file for details.
