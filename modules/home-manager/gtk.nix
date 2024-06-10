{ config, pkgs, lib, ... }:
let cfg = config.gtk;
in {
  options.gtk.tokyonight = lib.tn.mkTokyonightOpt "tokyonight gtk";
  config = lib.mkMerge [
    (lib.mkIf cfg.enable {
      gtk.theme = {
        package = pkgs.tokyonight-gtk-theme;
        name = "tokyonight-gtk-theme_full";
      };
    })
  ];
}
