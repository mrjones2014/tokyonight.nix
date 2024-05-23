{ inputs, config, lib, ... }:
let cfg = config.programs.fish.tokyonight;
in {
  options.programs.fish.tokyonight = lib.tn.mkTokyonightOpt "tokyonight fish";
  config = lib.mkMerge [
    (lib.mkIf cfg.enable {
      programs.fish.interactiveShellInit = builtins.readFile
        "${inputs.tokyonight}/extras/fish/tokyonight_${cfg.style}.fish";
    })
  ];
}
