{ config, lib, ... }:
let
  cfg = config.programs.fzf.tokyonight;
  # See [this issue](https://github.com/folke/tokyonight.nvim/issues/542).
  # tl;dr: the upstream themes take control away from the user for the `--layout` fzf option,
  # so we vendor the themes here.
  themes = {
    day = ''
      export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
        --color=fg:#3760bf,bg:#e1e2e7,hl:#b15c00 \
        --color=fg+:#3760bf,bg+:#c4c8da,hl+:#b15c00 \
        --color=info:#2e7de9,prompt:#007197,pointer:#007197 \
        --color=marker:#587539,spinner:#587539,header:#587539"
    '';
    night = ''
      export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
        --color=fg:#c0caf5,bg:#1a1b26,hl:#ff9e64 \
        --color=fg+:#c0caf5,bg+:#292e42,hl+:#ff9e64 \
        --color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff \
        --color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a"
    '';
    moon = ''
      export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
        --color=fg:#c8d3f5,bg:#222436,hl:#ff966c \
        --color=fg+:#c8d3f5,bg+:#2f334d,hl+:#ff966c \
        --color=info:#82aaff,prompt:#86e1fc,pointer:#86e1fc \
        --color=marker:#c3e88d,spinner:#c3e88d,header:#c3e88d"
    '';
    storm = ''
      export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
        --color=fg:#c0caf5,bg:#24283b,hl:#ff9e64 \
        --color=fg+:#c0caf5,bg+:#292e42,hl+:#ff9e64 \
        --color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff \
        --color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a"
    '';
  };
in
{
  options.programs.fzf.tokyonight = lib.tn.mkTokyonightOpt "tokyonight fzf";
  config = lib.mkMerge [
    (lib.mkIf cfg.enable {
      programs =
        let shell_theme = themes.${cfg.style};
        in {
          # these are .zsh files, but the syntax is compatible
          fish.interactiveShellInit = shell_theme;
          bash.initExtra = shell_theme;
          zsh.initExtra = shell_theme;
        };
    })
  ];
}
