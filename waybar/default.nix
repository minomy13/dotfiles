{ pkgs, ... }:
{
  home.packages = with pkgs; [
    jq
    pavucontrol
  ];

  programs.waybar = {
    enable = true;
    settings.main = {
      spacing = 4;

      modules-left = [
        "custom/nixos"
        "hyprland/workspaces"
      ];
      modules-center = [ "hyprland/window" ];
      modules-right = [
        "network"
        "pulseaudio"
        "cpu"
        "memory"
        "custom/temp"
        "custom/water-temp"
        "clock"
      ];

      "custom/nixos" = {
        format = "";
        tooltip = false;
      };

      "hyprland/workspaces" = {
        disable-scroll = true;
        all-outputs = true;
        warp-on-scroll = false;
        format = "{name}";
      };

      network = {
        format-ethernet = "󰌗  {ipaddr}/{cidr}";
        format-wifi = "   {essid} ({signalStrength}%)";
        format-disconnected = "Disconnected ⚠";
        tooltip = false;
      };

      pulseaudio = {
        format = "   {volume}%";
        format-muted = " ";
        on-click = "pavucontrol";
      };

      cpu = {
        format = "  {usage}%";
      };

      memory = {
        format = "  {}%";
      };

      "custom/temp" = {
        exec = ./temperature.sh;
        interval = 10;
        format = " {text}";
        tooltip = false;
      };

      "custom/water-temp" = {
        exec = ./water-temperature.sh;
        interval = 30;
        format = "󰏈  {text}";
        tooltip = false;
      };

      clock = {
        tooltip = false;
      };
    };
    style = builtins.readFile ./style.css;
  };
}
