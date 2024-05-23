{ inputs, config, lib, ... }:
let cfg = config.programs.git.delta.tokyonight;
in {
  options.programs.git.delta.tokyonight =
    lib.tn.mkTokyonightOpt "tokyonight git delta";
  config = lib.mkMerge [
    (lib.mkIf cfg.enable {
      programs.git = {
        includes = [{
          path =
            "${inputs.tokyonight}/extras/delta/tokyonight_${cfg.style}.gitconfig";
        }];
        delta.options.features = "tokyonight_${cfg.style}";
      };
    })
  ];
}
