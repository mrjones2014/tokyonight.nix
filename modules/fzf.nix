inputs:
{ config, lib, ... }:
let
  inherit (config.tokyonight) style;
  fzfEnabled = config.programs.fzf.enable;
in {
  options.fzf.tokyonight = {
    enable = lib.mkEnableOption "tokyonight colorscheme";
  };
  config = lib.mkMerge [
    (lib.mkIf fzfEnabled {
      programs = {
        # these are .zsh files, but the syntax is compatible
        fish.interactiveShellInit = builtins.readFile
          "${inputs.tokyonight}/extras/fzf/tokyonight_${style}.zsh";
        bash.interactiveShellInit = builtins.readFile
          "${inputs.tokyonight}/extras/fzf/tokyonight_${style}.zsh";
        zsh.interactiveShellInit = builtins.readFile
          "${inputs.tokyonight}/extras/fzf/tokyonight_${style}.zsh";
      };
    })
  ];
}
