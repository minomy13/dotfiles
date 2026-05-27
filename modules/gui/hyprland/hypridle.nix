{ lib, config, ... }:
let
  cfg = config.gui.hypridle;
in
{
  options.gui.hypridle = {
    enable = lib.mkEnableOption "Enable hypridle";
    dimDisplay = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Display will be dimmed via brightnessctl. Useful for laptops.";
    };
    suspend = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "System will suspend after some time passed.";
    };
  };

  config.hm.services.hypridle = {
    enable = cfg.enable;

    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener =
        (
          if cfg.dimDisplay then
            [
              {
                timeout = 120;
                on-timeout = "brightnessctl -c backlight -s set 10";
                on-resume = "brightnessctl -c backlight -r";
              }
            ]
          else
            [ ]
        )
        ++ [
          {
            timeout = 300;
            on-timeout = "loginctl lock-session";
          }
          {
            timeout = 330;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on && brightnessctl -r";
          }
        ]
        ++ (
          if cfg.suspend then
            [
              {
                timeout = 1800;
                on-timeout = "systemctl suspend";
              }
            ]
          else
            [ ]
        );

    };
  };
}
