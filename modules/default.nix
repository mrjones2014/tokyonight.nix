inputs:
{ lib, ... }: {
  imports = [
    (import ./global.nix inputs)
    (import ./bat.nix inputs)
    (import ./delta.nix inputs)
    (import ./fish.nix inputs)
    (import ./fzf.nix inputs)
    (import ./neovim.nix inputs)
  ];
}

