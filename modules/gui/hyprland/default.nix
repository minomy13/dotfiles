{ pkgs, ... }:
{
  imports = [
    ./hyprlock.nix
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

  hm.home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
  hm.home.file.".config/hypr/bar" = {
    source = ./bar;
    recursive = true;
  };

  hm.services.awww.enable = true;
}
