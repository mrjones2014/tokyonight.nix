{ config, lib, ... }:
let
  cfg = config.programs.fzf.tokyonight;
  themes = {
    day = builtins.readFile ../../resources/fzf/tokyonight_day.sh;
    night = builtins.readFile ../../resources/fzf/tokyonight_night.sh;
    moon = builtins.readFile ../../resources/fzf/tokyonight_moon.sh;
    storm = builtins.readFile ../../resources/fzf/tokyonight_storm.sh;
  };
in {
  options.programs.fzf.tokyonight = lib.tn.mkTokyonightOpt "tokyonight fzf";
  config = lib.mkMerge [
    (lib.mkIf cfg.enable {
      programs = let shell_theme = themes.${cfg.style};
      in {
        # these are .zsh files, but the syntax is compatible
        fish.interactiveShellInit = shell_theme;
        bash.initExtra = shell_theme;
        zsh.initExtra = shell_theme;
      };
    })
  ];
}
