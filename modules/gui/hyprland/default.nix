{ pkgs, ... }:
{
  imports = [
    ./waybar

    ./hyprlock.nix
    ./hypridle.nix
  ];

  hm.home.packages = with pkgs; [
    hyprshot
    hyprpicker
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };

  hm.home.file.".config/hypr/hyprland.lua".source = ./hyprland.lua;

  hm.services.awww.enable = true;
}
