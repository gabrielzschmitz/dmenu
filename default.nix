{
  lib,
  stdenv,
  libX11,
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
    libXinerama
    libXft
    zlib
  ];

  installFlags = [ "PREFIX=$(out)" ];

  postInstall = ''
    # Install additional scripts if present
    if [ -f dmenu_path ]; then
      cp dmenu_path $out/bin/
      chmod 755 $out/bin/dmenu_path
    fi
    if [ -f dmenu_run ]; then
      cp dmenu_run $out/bin/
      chmod 755 $out/bin/dmenu_run
    fi
    if [ -f stest ]; then
      cp stest $out/bin/
      chmod 755 $out/bin/stest
    fi

    # Install desktop entry if present
    if [ -f dmenu.desktop ]; then
      mkdir -p $out/share/applications
      cp dmenu.desktop $out/share/applications/
    fi

    # Install icon if present
    if [ -f dmenu.png ]; then
      mkdir -p $out/share/icons/hicolor/256x256/apps
      cp dmenu.png $out/share/icons/hicolor/256x256/apps/
    elif [ -f ../dmenu.png ]; then
      mkdir -p $out/share/icons/hicolor/256x256/apps
      cp ../dmenu.png $out/share/icons/hicolor/256x256/apps/
    elif [ -f ../dmenu.svg ]; then
      mkdir -p $out/share/icons/hicolor/scalable/apps
      cp ../dmenu.svg $out/share/icons/hicolor/scalable/apps/
    fi
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
