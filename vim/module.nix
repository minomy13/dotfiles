{ lib, inputs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    plugins = {
      bufferline.enable = true;
      lualine.enable = true;
      noice.enable = true;
    };
  };
}
