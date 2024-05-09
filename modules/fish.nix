inputs:
{ config, lib, ... }:
let inherit (config.tokyonight) style;
in {
  options.programs.fish.tokyonight = {
    enable = lib.mkEnableOption "tokyonight colorscheme";
  };
  config = lib.mkMerge [
    (lib.mkIf config.programs.fish.tokyonight.enable {
      programs.fish.interactiveShellInit = builtins.readFile
        "${inputs.tokyonight}/extras/fish/tokyonight_${style}.fish";
    })
  ];
}
