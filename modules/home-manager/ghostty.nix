{ config, lib, ... }:
let
  cfg = config.programs.ghostty.tokyonight;
  toTitleCase =
    str:
    lib.strings.toUpper (lib.strings.substring 0 1 str)
    + lib.strings.substring 1 (lib.strings.stringLength str) str;
in
{
  options.programs.ghostty.tokyonight = lib.tn.mkTokyonightOpt "tokyonight ghostty";
  config = lib.mkMerge [
    (lib.mkIf cfg.enable {
      programs.ghostty.settings.theme = "TokyoNight " + (toTitleCase cfg.style);
    })
  ];
}
