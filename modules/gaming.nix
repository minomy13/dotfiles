{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.gaming;
in
{
  options.gaming = {
    minecraft.enable = lib.mkEnableOption "Prism Launcher (Minecraft)";
    steam.enable = lib.mkEnableOption "Steam";
  };

  config = {
    environment.systemPackages = lib.optionals cfg.minecraft.enable [ pkgs.prismlauncher ];
  };
}
