{ pkgs, ... }:
{
  hm.home.packages = with pkgs; [
    hyprshot
    hyprpicker
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  hm.home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
  hm.home.file.".config/hypr/bar" = {
    source = ./bar;
    recursive = true;
  };

  hm.services.swww.enable = true;
}
