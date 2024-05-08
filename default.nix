inputs:
{ lib, ... }:
let
  listModules = dir:
    lib.mapAttrs (file: type:
      if type == "directory" then listModules "${dir}/${file}" else file)
    (builtins.readDir dir);
  allModules = listModules ./modules;
  imports = [
    (./global.nix {
      inherit inputs;
      inherit allModules;
    })
  ] ++ allModules;
in { inherit imports; }

