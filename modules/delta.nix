inputs:
{ config, lib, ... }:
let
  inherit (config.tokyonight) style;
  deltaEnabled = config.programs.git.delta.tokyonight.enable;
in {
  options.delta.tokyonight = {
    enable = lib.mkEnableOption "tokyonight colorscheme";
  };
  config = lib.mkMerge [
    (lib.mkIf deltaEnabled {
      programs.git = {
        includes = [{
          path =
            "${inputs.tokyonight}/extras/delta/tokyonight_${style}.gitconfig";
        }];
        delta.options.features = "tokyonight_${style}";
      };
    })
  ];
}
