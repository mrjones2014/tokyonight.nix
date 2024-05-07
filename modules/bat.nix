inputs:
{ config, lib, ... }:
let
  inherit (config.tokyonight) style;
  batEnabled = config.programs.bat.enable;
in {
  options.bat.tokyonight = {
    enable = lib.mkEnableOption "tokyonight colorscheme";
  };
  config = lib.mkMerge [
    (lib.mkIf batEnabled {
      programs.bat = {
        config.theme = "tokyonight_${style}";
        themes.${"tokyonight_${style}"} = builtins.readFile
          "${inputs.tokyonight}/extras/sublime/tokyonight_${style}.toml";
      };
    })
  ];
}
