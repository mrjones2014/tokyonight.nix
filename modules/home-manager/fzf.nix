{ inputs, config, lib, ... }:
let cfg = config.programs.fzf.tokyonight;
in {
  options.programs.fzf.tokyonight = lib.tn.mkTokyonightOpt "tokyonight fzf";
  config = lib.mkMerge [
    (lib.mkIf cfg.enable {
      programs = {
        # these are .zsh files, but the syntax is compatible
        fish.interactiveShellInit = builtins.readFile
          "${inputs.tokyonight}/extras/fzf/tokyonight_${cfg.style}.zsh";
        bash.initExtra = builtins.readFile
          "${inputs.tokyonight}/extras/fzf/tokyonight_${cfg.style}.zsh";
        zsh.initExtra = builtins.readFile
          "${inputs.tokyonight}/extras/fzf/tokyonight_${cfg.style}.zsh";
      };
    })
  ];
}
