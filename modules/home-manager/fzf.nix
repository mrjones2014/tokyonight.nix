{ config, lib, ... }:
let cfg = config.programs.fzf.tokyonight;
in {
  options.programs.fzf.tokyonight = lib.tn.mkTokyonightOpt "tokyonight fzf";
  config = lib.mkMerge [
    (lib.mkIf cfg.enable {
      programs = {
        # these are .zsh files, but the syntax is compatible
        fish.interactiveShellInit =
          builtins.readFile ../../resources/fzf/tokyonight_${cfg.style}.sh;
        bash.initExtra =
          builtins.readFile ../../resources/fzf/tokyonight_${cfg.style}.sh;
        zsh.initExtra =
          builtins.readFile ../../resources/fzf/tokyonight_${cfg.style}.sh;
      };
    })
  ];
}
