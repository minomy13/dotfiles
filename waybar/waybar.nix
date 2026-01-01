{
  programs.waybar = {
    enable = true;
    settings.main = {
      spacing = 4;

      modules-left = [ "custom/nixos" "hyprland/workspaces" ];
      modules-center = [ "hyprland/window" ];
      modules-right = [ "network" "cpu" "memory" "temperature" "clock" ];

      "custom/nixos" = {
        format = "";
	tooltip = false;
      };

      "clock" = {
        tooltip = false;
      };

      "hyprland/workspaces" = {
        disable-scroll = true;
	all-outputs = true;
	warp-on-scroll = false;
	format = "{name}";
      };
    };
    style = builtins.readFile ./style.css;
  };
}
