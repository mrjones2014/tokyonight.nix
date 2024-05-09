# tokyonight.nix

A Nix Flake providing a [home-manager](https://github.com/nix-community/home-manager) module to apply the popular [tokyonight](https://github.com/folke/tokyonight.nvim)
colorscheme to your favorite apps.

## Usage

Consume the flake however you normally would in your Nix setup, then you can do:

```nix
{
  imports = [ tokyonight.homeManagerModules.default ];
  programs = {
    git.delta.tokyonight.enable = true;
    bat.tokyonight.enable = true;
    fish.tokyonight.enable = true;
    fzf.tokyonight.enable = true;
  };
}
```

Note that Wezterm has the theme built-in, so you can just set:

```lua
config.color_scheme = 'tokyonight_night' -- or tokyonight_day, or whatever style
```

in your Wezterm Lua.

All supported modules can be found in [./modules](https://github.com/mrjones2014/tokyonight.nix/tree/master/modules).

## Contributions Welcome!

If you don't see an app supported, please feel free to add it via a PR!
