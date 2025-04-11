{ config, lib, ... }:
let cfg = config.programs.ghostty.tokyonight;
in {
  options.programs.ghostty.tokyonight = lib.tn.mkTokyonightOpt "tokyonight ghostty";
  config = lib.mkMerge [
    (lib.mkIf cfg.enable {
      programs.ghostty.settings.theme = "tokyonight_${cfg.style}";
    })
  ];
}
