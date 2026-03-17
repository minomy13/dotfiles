{ pkgs, ... }:
{
  hm.home.packages = with pkgs; [
    vim
    obsidian
  ];
}
