inputs:
{ config, lib, ... }:
let inherit (config.tokyonight) style;
in {
  options.programs.bat.tokyonight = {
    enable = lib.mkEnableOption "tokyonight colorscheme";
  };
  config = lib.mkMerge [
    (lib.mkIf config.programs.bat.tokyonight.enable {
      programs.bat = {
        config.theme = "tokyonight_${style}";
        themes.${"tokyonight_${style}"} = {
          src = "${inputs.tokyonight}/extras/sublime/";
          file = "tokyonight_${style}.tmTheme";
        };
      };
    })
  ];
}
