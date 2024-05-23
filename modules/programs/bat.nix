{ inputs, config, lib, ... }:
let cfg = config.programs.bat.tokyonight;
in {
  options.programs.bat.tokyonight = {
    enable = lib.mkEnableOption "tokyonight colorscheme";
  };
  config = lib.mkMerge [
    (lib.mkIf cfg.enable {
      programs.bat = {
        config.theme = "tokyonight_${cfg.style}";
        themes.${"tokyonight_${cfg.style}"} = {
          src = "${inputs.tokyonight}/extras/sublime/";
          file = "tokyonight_${cfg.style}.tmTheme";
        };
      };
    })
  ];
}
