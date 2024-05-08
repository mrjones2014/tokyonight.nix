inputs:
{ lib, ... }: {
  imports = [
    (./global.nix inputs)
    (./bat.nix inputs)
    (./delta.nix inputs)
    (./fish.nix inputs)
    (./fzf.nix inputs)
    (./neovim.nix inputs)
    (./wezterm.nix inputs)
  ];
}

