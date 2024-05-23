{ inputs, config, lib, ... }:
let cfg = config.programs.rofi.tokyonight;
in {
  options.programs.rofi.tokyonight = {
    enable = lib.mkEnableOption "tokyonight colorscheme";
    variant = lib.mkOption {
      type = lib.types.enum [ "default" "big1" "big2" ];
      description =
        "Which variant to use, see: https://github.com/w8ste/Tokyonight-rofi-theme";
      default = "default";
    };
  };
  config = lib.mkMerge [
    (lib.mkIf cfg.enable {
      programs.rofi = {
        theme = {
          "@theme" = builtins.path {
            name = "tokyonight-${cfg.style}.rasi";
            path = "${inputs.tokyonight-rofi}/tokyonight${
                if config.programs.rofi.tokyonight.variant != "default" then
                  "_${config.programs.rofi.tokyonight.variant}"
                else
                  ""
              }.rasi";
          };
        };
      };
    })
  ];
}
