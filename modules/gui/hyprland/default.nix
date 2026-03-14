{ ... }:
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  hm.home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;

  hm.services.swww.enable = true;
}
