{ ... }:
{
  hm.programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "JetBrainsMonoNF";
          style = "Regular";
        };
      };
      window = {
        padding = {
          x = 8;
          y = 5;
        };
        dynamic_padding = true;
        opacity = 0.8;
      };
    };
  };
}
