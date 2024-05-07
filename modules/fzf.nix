inputs:
{ config, lib, ... }:
let
  inherit (config.tokyonight) style;
  fzfEnabled = config.programs.fzf.enable;
in {
  options.fish.tokyonight = {
    enable = lib.mkEnableOption "tokyonight colorscheme";
  };
  config = lib.mkMerge [
    (lib.mkIf fzfEnabled {
      # TODO fix
      programs.fzf.TODO = builtins.readFile
        "${inputs.tokyonight}/extras/fzf/tokyonight_${style}.TODO";
    })
  ];
}
