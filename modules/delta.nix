inputs:
{ config, lib, ... }:
let inherit (config.tokyonight) style;
in {
  options.programs.git.delta.tokyonight = {
    enable = lib.mkEnableOption "tokyonight colorscheme";
  };
  config = lib.mkMerge [
    (lib.mkIf config.programs.git.delta {
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
