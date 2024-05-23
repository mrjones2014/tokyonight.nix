inputs:
{ lib, pkgs, ... }@args: {
  imports = import ../lib/mkImports.nix (args // { inherit inputs; }) ./.;
}
