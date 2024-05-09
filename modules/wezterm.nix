# NOTE: Wezterm is a special case, the user has to set `config.color_scheme = "tokyonight_${config.tokyonight.style}"` in their own config
inputs:
{ config, lib, ... }:
let inherit (config.tokyonight) style;
in {
  options.programs.wezterm.tokyonight = {
    enable = lib.mkEnableOption "tokyonight colorscheme";
  };
  config = lib.mkMerge [
    (lib.mkIf config.programs.wezterm.enable {
      programs.wezterm.colorSchemes = [
        builtins.fromTOML
        (builtins.readFile
          "${inputs.tokyonight}/extras/wezterm/tokyonight_${style}.toml")
      ];
    })
  ];
}
