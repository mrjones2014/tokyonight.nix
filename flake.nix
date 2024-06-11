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
    tokyonight-firefox = {
      type = "github";
      owner = "D4rkKaizen";
      repo = "FirefoxCSS-TokyoNight";
      flake = false;
    };
  };

  outputs = inputs@{ self, ... }: {
    homeManagerModules.default = import ./modules/home-manager inputs;
  };
}
