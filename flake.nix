{
  description =
    "Nix Flake for easily applying Tokyonight color scheme to different applications";
  inputs = {
    tokyonight = {
      type = "github";
      owner = "folke";
      repo = "tokyonight.nvim";
      flake = false;
    };
    tokyonight-rofi = {
      type = "github";
      owner = "w8ste";
      repo = "Tokyonight-rofi-theme";
      flake = false;
    };
  };

  outputs = inputs@{ self, ... }: {
    hmModules.default = import ./modules inputs;
  };
}
