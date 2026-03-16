{ ... }:
{
  hm.services.dunst = {
    enable = true;
    settings = {
      global = {
        transparency = 20;
        frame_color = "#3f3f3f";
      };

      urgency_normal = {
        background = "#161616";
        foreground = "#ffffff";
        timeout = 10;
      };
    };
  };
}
