{ lib, ... }:
{
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "obsidian"
      "1password"
      "1password-cli"
      "nvidia-x11"
      "nvidia-settings"
      "steam"
      "steam-unwrapped"
    ];
}
