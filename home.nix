{ config, pkgs, ... }:

{
  imports = [
    ./waybar/module.nix
  ];

  home.username = "adrian";
  home.homeDirectory = "/home/adrian";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [ rofi prismlauncher ];

  programs.neovim = {
    enable = true;
    vimAlias = true;
    extraConfig = ''
      imap jj <Esc>
      set number relativenumber
    '';
  };

  programs.starship.enable = true; 

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = { family = "JetBrainsMonoNF"; style = "Regular"; };
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

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      update = "sudo nixos-rebuild switch --flake ~/dotfiles#nixos";
    };
    history.size = 10000;
  };

  services.swww.enable = true;

  home.file.".config/hypr/hyprland.conf".source = ./hypr/hyprland.conf;
}
