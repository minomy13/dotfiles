{ pkgs, ... }:
{
  hm.home.packages = with pkgs; [ pavucontrol ];

  hm.programs.waybar = {
    enable = true;
    style = builtins.readFile ./style.css;

    settings.main = {
      spacing = 12;
      position = "left";

      modules-left = [
        "image#flake"
        "hyprland/workspaces"
      ];

      modules-right = [
        "pulseaudio"
        "cpu"
        "memory"
        "custom/cpu-temp"
        "custom/water-temp"
        "battery"
        "clock"
      ];

      # MODULES
      "image#flake" = {
        path = ./nix-snowflake-colours.svg;
        size = 18;
      };

      "hyprland/workspaces" = {
        all-outputs = true;
        format = "{name}";
      };

      pulseaudio = {
        format = "\n{volume}";
        format-muted = "\nXX";
        justify = "center";
        on-click = "pavucontrol";
      };

      cpu = {
        format = "\n{:02.0f}";
        justify = "center";
      };

      memory = {
        format = "\n{}";
        justify = "center";
      };

      "custom/cpu-temp" = {
        format = "\n{text}";
        tooltip = false;
        interval = 5;
        justify = "center";
        exec = pkgs.writeShellScript "fetch-cpu-temperature" ''
          ${pkgs.curl}/bin/curl http://127.0.0.1:27003/api/cpuTemp/clean --silent | ${pkgs.jq}/bin/jq -r '.data|round'
        '';
      };

      "custom/water-temp" = {
        format = "󰏈\n{text}";
        tooltip = false;
        interval = 5;
        justify = "center";
        exec = pkgs.writeShellScript "fetch-water-temperature" ''
          ${pkgs.curl}/bin/curl http://127.0.0.1:27003/api/devices/ --silent | ${pkgs.jq}/bin/jq -r '.devices | map(select(.Product == "iCUE LINK System Hub")) | .[] | .GetDevice | .devices | map(select(.name == "iCUE LINK XD6 ELITE LCD")) | .[] | .temperature | round'
        '';
      };

      battery = {
        format = "{icon}\n{capacity}";
        format-icons = {
          default = [
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
          charging = [ "󰂄" ];
        };
        justify = "center";
      };

      clock = {
        tooltip = false;
        format = "{0:%H}\n{0:%M}";
      };
    };
  };
}
