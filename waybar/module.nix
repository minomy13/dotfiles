{ pkgs, ... }: {
  home.packages = with pkgs; [ jq ];

  programs.waybar = {
    enable = true;
    settings.main = {
      spacing = 4;

      modules-left = [ "custom/nixos" "hyprland/workspaces" ];
      modules-center = [ "hyprland/window" ];
      modules-right = [ "network" "cpu" "memory" "custom/temp" "clock" ];

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
	tooltip = false;
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

      clock = {
        tooltip = false;
      };
    };
    style = builtins.readFile ./style.css;
  };
}
