{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  name = "dmenu-dev";

  nativeBuildInputs = with pkgs; [
    pkg-config
    gnumake
    gcc
    bear
    clang-tools
  ];

  buildInputs = with pkgs; [
    fontconfig
    freetype
    libX11
    imlib2
    libXinerama
    libXft
    zlib
  ];
}
