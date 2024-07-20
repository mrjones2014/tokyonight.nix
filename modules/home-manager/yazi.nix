{ inputs, config, lib, ... }:
let cfg = config.programs.yazi.tokyonight;
in {
  options.programs.yazi.tokyonight = lib.tn.mkTokyonightOpt "tokyonight yazi";
  config = lib.mkMerge [
    (lib.mkIf cfg.enable {
      programs.yazi = {
        theme = lib.importTOML
          "${inputs.tokyonight}/extras/yazi/tokyonight_${cfg.style}.toml";
      };
    })
  ];
}
