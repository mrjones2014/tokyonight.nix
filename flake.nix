{
  description =
    "Nix Flake for easily applying Tokyonight color scheme to different applications";
  inputs.tokyonight = {
    type = "github";
    owner = "folke";
    repo = "tokyonight.nvim";
    flake = false;
  };

  outputs = inputs@{ self, ... }: {
    homeManagerModules.default = import ./modules inputs;
  };
}
