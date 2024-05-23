{ lib, ... }: {
  options.tokyonight = {
    enable = lib.mkEnableOpt "Tokyonight globally";
    style = lib.mkOption {
      type = lib.types.enum [ "storm" "night" "moon" "day" ];
      default = "night";
      description = "Set the tokyonight colorscheme style variant to use.";
    };
  };
}
