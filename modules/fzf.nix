inputs:
{ config, lib, ... }:
let inherit (config.tokyonight) style;
in {
  options.programs.fzf.tokyonight = {
    enable = lib.mkEnableOption "tokyonight colorscheme";
  };
  config = lib.mkMerge [
    (lib.mkIf config.fzf.tokyonight.enable {
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
