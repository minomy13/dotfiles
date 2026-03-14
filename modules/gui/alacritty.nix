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
          x = 15;
          y = 8;
        };
        opacity = 0.8;
      };
    };
  };
}
