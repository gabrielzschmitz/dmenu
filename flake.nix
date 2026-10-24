{
  description = "Custom build of suckless dmenu by gabrielzschmitz";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      packages = forAllSystems (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          default = pkgs.callPackage ./default.nix { };
          dmenu = self.packages.${system}.default;
        }
      );

      overlays.default = final: prev: {
        dmenu-gabrielzschmitz = final.callPackage ./default.nix { };
      };
    };
}
