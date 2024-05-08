{ inputs, moduleList }:
{ config, lib, ... }: {
  options.tokyonight = {
    style = lib.mkOption {
      type = lib.types.enum [ "storm" "night" "moon" "day" ];
      default = "night";
      description = "Set the tokyonight colorscheme style variant to use.";
    };
    enableAllModules = lib.mkEnableOption "All tokyonight.nix modules";
  };
  config =
    let getModule = path: lib.removeSuffix (builtins.baseNameOf path) ".nix";
    in lib.mkMerge [
      (lib.mkIf config.tokyonight.enableAllModules (builtins.listToAttrs
        (builtins.map (mod: {
          name = "programs.${mod}.tokyonight.enable";
          value = true;
        })) (builtins.map getModule moduleList)))
    ];
}
