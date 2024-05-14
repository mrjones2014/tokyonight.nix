# tokyonight.nix

A Nix Flake providing a [home-manager](https://github.com/nix-community/home-manager) module to apply the popular [tokyonight](https://github.com/folke/tokyonight.nvim)
colorscheme to your favorite apps.

## Contributions Welcome!

If you don't see an app supported, please feel free to add it via a PR!

## Usage

Consume the flake however you normally would in your Nix setup, then you can do:

```nix
{
  imports = [ tokyonight.homeManagerModules.default ];
  # or night, moon, or day
  tokyonight.style = "storm";
  programs = {
    git.delta.tokyonight.enable = true;
    bat.tokyonight.enable = true;
    fish.tokyonight.enable = true;
    fzf.tokyonight.enable = true;
    rofi.tokyonight.enable = true;
  };
}
```

The list of supported modules can be found in [./modules](https://github.com/mrjones2014/tokyonight.nix/tree/master/modules).

### Special Cases

<details>

<summary>Wezterm</summary>

Wezterm has the theme built-in, and doesn't have a good way for this flake
to set it up for you, since it's mostly configured through the `extraConfig`
field with Lua, so you will need to just put the following in your Lua config:

```lua
# If using `local config = wezterm.config_builder()`
config.color_scheme = 'tokyonight_night' -- or tokyonight_day, or whatever style

# otherwise
return {
  color_scheme = 'tokyonight_night', -- or tokyonight_day, or whatever style
  -- rest of your config here
}
```

</details>

<details>

<summary>btop</summary>

`btop` has `tokyo-night` and `tokyo-storm` built-in. If you're using one of those,
you can set the following in your Nix config.

```nix
programs.btop.settings.color_theme = "tokyo-night" # or tokyo-storm
```

If you are using one of the other variants of Tokyonight, you can get a pretty good approximation for `btop`
by using `tokyo-night` with a transparent background:

```nix
programs.btop.settings = {
  color_theme = "tokyo-night" # or tokyo-storm
  theme_background = false;
};
```

</details>

## Acknowledgements

Inspired by all the hard work on the [Catppuccin Nix Flake](https://github.com/catppuccin/nix)!
