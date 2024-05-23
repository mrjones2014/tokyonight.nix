{ lib, config, ... }: {
  mkTokyonightOpt = name: {
    enable = lib.mkEnableOption "Tokyonight theme" // {
      default = config.tokyonight.enable;
    };
    style = lib.mkOption {
      type = lib.types.enum [ "storm" "night" "moon" "day" ];
      default = config.tokyonight.style;
      description = "Set the tokyonight colorscheme style variant to use.";
    };
  };
}
