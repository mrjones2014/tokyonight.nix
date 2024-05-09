inputs:
{ config, lib, ... }:
let inherit (config.tokyonight) style;
in {
  options.programs.neovim.tokyonight = {
    enable = lib.mkEnableOption "tokyonight colorscheme";
    extraLua = lib.mkOption {
      type = lib.types.lines;
      default = ''
        require('tokyonight').setup({
          style = "${style}"
        })
      '';
      example = ''
        require('tokyonight').setup({
          -- if you use this option, you must
          -- set the style property yourself
          -- e.g.
          style = "night",
        })
      '';
      description =
        "Configure tokyonight.nvim yourself; see https://github.com/folke/tokyonight.nvim?#%EF%B8%8F-configuration for options.";
    };
  };
  config = lib.mkMerge [
    (lib.mkIf config.programs.neovim.tokyonight.enable {
      programs.neovim = {
        config.theme = "tokyonight_${style}";
        themes.${"tokyonight_${style}"} = builtins.readFile
          "${inputs.tokyonight}/extras/sublime/tokyonight_${style}.toml";
      };
    })
  ];
}
