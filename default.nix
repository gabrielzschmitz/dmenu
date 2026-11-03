{
  lib,
  stdenv,
  libX11,
  imlib2,
  libXinerama,
  libXft,
  zlib,
  pkg-config,
}:

stdenv.mkDerivation {
  pname = "dmenu";
  version = "5.4";

  src = ./src;

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [
    libX11
    imlib2
    libXinerama
    libXft
    zlib
  ];

  makeFlags = [
    "ICONPATH=${placeholder "out"}/share/icons/hicolor/256x256/apps/dmenu.png"
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    cp dmenu $out/bin/
    cp dmenu_run $out/bin/
    cp dmenu_path $out/bin/
    cp stest $out/bin/
    chmod 755 $out/bin/dmenu
    chmod 755 $out/bin/dmenu_run
    chmod 755 $out/bin/dmenu_path
    chmod 755 $out/bin/stest

    mkdir -p $out/share/man/man1
    sed "s/VERSION/$version/g" < dmenu.1 > $out/share/man/man1/dmenu.1
    chmod 644 $out/share/man/man1/dmenu.1

    mkdir -p $out/share/icons/hicolor/256x256/apps
    cp dmenu.png $out/share/icons/hicolor/256x256/apps/dmenu.png

    runHook postInstall
  '';

  meta = {
    mainProgram = "dmenu";
    description = "Custom build of the suckless dynamic menu by gabrielzschmitz";
    longDescription = ''
      dmenu (dynamic menu) is a lightweight and efficient menu for X, commonly
      used to launch applications or select items from a list. This package
      provides a custom build maintained by gabrielzschmitz, incorporating
      patches and configuration changes.
    '';
    homepage = "https://github.com/gabrielzschmitz/dmenu";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ gabrielzschmitz ];
    platforms = lib.platforms.linux;
  };
}
