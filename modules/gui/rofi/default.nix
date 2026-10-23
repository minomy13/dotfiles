{ pkgs, ... }:
{
  hm.programs.rofi = {
    enable = true;
    theme = "DarkBlue";
    settings = {
      show-icons = true;
      modes = [ "drun" ];
    };
    plugins = [ pkgs.rofi-calc ];
  };
}
