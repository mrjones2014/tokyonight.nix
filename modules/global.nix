inputs:
{ config, lib, ... }: {
  options.tokyonight = {
    style = lib.mkOption {
      type = lib.types.enum [ "storm" "night" "moon" "day" ];
      default = "night";
      description = "Set the tokyonight colorscheme style variant to use.";
    };
  };
}
