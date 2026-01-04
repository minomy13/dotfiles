{ config, pkgs, inputs, ... }:

{
  imports = [
    ./waybar/module.nix
    ./vim/default.nix
  ];

  home.username = "adrian";
  home.homeDirectory = "/home/adrian";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [ rofi prismlauncher kdePackages.qtsvg kdePackages.dolphin ];

  programs.starship.enable = true; 

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = { family = "JetBrainsMonoNF"; style = "Regular"; };
      };
      window = {
        padding = { x = 15; y = 8; };
	opacity = 0.8;
      };
    };
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "minomy13";
        email = "mail@minomy13.com";
      };
      init.defaultBranch = "main";
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
    };
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      update = "sudo nixos-rebuild switch --flake ~/dotfiles#nixos";
      update-test = "sudo nixos-rebuild test --flake ~/dotfiles#nixos";
      vim = "nvim";
    };
    history.size = 10000;
  };

  services.swww.enable = true;

  home.file.".config/hypr/hyprland.conf".source = ./hypr/hyprland.conf;
}
