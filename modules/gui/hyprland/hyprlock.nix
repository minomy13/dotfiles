{ ... }:
{
  hm.programs.hyprlock = {
    enable = true;
    settings = {
      background.path = "~/wallpapers/japan/landscape_with_samurai.jpg";
      input-field = {
        size = "450, 80";
        dots_size = 0.08;
        font_color = "rgba(255, 255, 255, 1)";
        outer_color = "rgba(0, 0, 0, 0)";
        inner_color = "rgba(255, 255, 255, 0.3)";
        valign = "bottom";
        position = "0, 180";
        placeholder_text = "password";
      };
      label = [
        {
          text = "$TIME12";
          font_size = 100;
          valign = "top";
          position = "0, -330";
        }
        {
          text = "cmd[update:1000] echo -e \"$(LC_TIME=en_US.UTF-8 date +\"%A, %B %d\")\"";
          font_size = 30;
          valign = "top";
          position = "0, -490";
        }
      ];
    };
  };
}
