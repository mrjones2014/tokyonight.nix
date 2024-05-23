{ config, lib, pkgs, ... }:
let cfg = config.programs.neovim.tokyonight;
in {
  options.programs.neovim.tokyonight =
    (lib.tn.mkTokyonightOpt "tokyonight neovim") // {
      extraLua = lib.mkOption {
        type = lib.types.lines;
        default = ''
          require('tokyonight').setup({
            style = "${cfg.style}"
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
    (lib.mkIf cfg.enable {
      programs.neovim = {
        plugins = [ pkgs.vimPlugins.tokyonight-nvim ];
        extraLuaConfig = ''
          ${if builtins.hasAttr "extraLua"
          config.programs.neovim.tokyonight then
            config.programs.neovim.tokyonight.extraLua
          else
            ""}
          vim.cmd.colorscheme("tokyonight-${cfg.style}")
        '';
      };
    })
  ];
}
