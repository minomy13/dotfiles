{ pkgs, ... }:
{
  hm.home.packages = with pkgs; [
    obsidian
    godot
    prismlauncher
  ];
}
