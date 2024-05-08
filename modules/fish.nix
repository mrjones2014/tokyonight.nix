inputs:
{ config, lib, ... }:
let
  inherit (config.tokyonight) style;
  fishEnabled = config.programs.fish.tokyonight.enable;
in {
  options.fish.tokyonight = {
    enable = lib.mkEnableOption "tokyonight colorscheme";
  };
  config = lib.mkMerge [
    (lib.mkIf fishEnabled {
      programs.fish.interactiveShellInit = builtins.readFile
        "${inputs.tokyonight}/extras/fish/tokyonight_${style}.fish";
    })
  ];
}
