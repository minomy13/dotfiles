{ pkgs, inputs, ... }:
{
  imports = [
    inputs.nixvim.nixosModules.nixvim

    ./keymaps.nix

    # plugins
    ./coding.nix
    ./editor.nix
    ./formatting.nix
    ./lsp.nix
    ./ui.nix
  ];

  programs.nixvim = {
    enable = true;

    extraPackages = with pkgs; [
      nixfmt
      rustfmt
      prettier
    ];

    colorschemes.dracula.enable = true;

    globals.mapleader = " ";
    globalOpts = {
      clipboard = "unnamedplus";
      number = true;
      relativenumber = true;
    };
  };
}
