{ config, pkgs, inputs, ... }:

{
  imports = [
    ./waybar/module.nix
    ./vim/default.nix
  ];

  home.username = "adrian";
  home.homeDirectory = "/home/adrian";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    rofi prismlauncher kdePackages.qtsvg kdePackages.dolphin
    firefox blender
  ];

  home.pointerCursor = {
    name = "phinger-cursors-dark";
    package = pkgs.phinger-cursors;
    hyprcursor = {
      enable = true;
      size = 32;
    };
  };

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

  programs.hyprlock = {
    enable = true;
    settings = {
      background.path = "~/wallpapers/japan/landscape_with_samurai.jpg";
      input-field = {
        size = "450, 80";
	"dots_size" = 0.08;
	"font_color" = "rgba(255, 255, 255, 1)";
	"outer_color" = "rgba(0, 0, 0, 0)";
	"inner_color" = "rgba(255, 255, 255, 0.3)";
	valign = "bottom";
	position = "0, 180";
	"placeholder_text" = "password";
      };
      label = [
        {
          text = "$TIME12";
          "font_size" = 100;
	  valign = "top";
	  position = "0, -330";
        }
        {
          text = "cmd[update:1000] echo -e \"$(LC_TIME=en_US.UTF-8 date +\"%A, %B %d\")\"";
  	  "font_size" = 30;
	  valign = "top";
	  position = "0, -490";
        }
      ];
    };
  };

  services.swww.enable = true;

  home.file.".config/hypr/hyprland.conf".source = ./hypr/hyprland.conf;
}
