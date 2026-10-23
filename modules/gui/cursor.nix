{ pkgs, ... }:
{
  hm.home.pointerCursor = {
    enable = true;
    name = "phinger-cursors-dark";
    package = pkgs.phinger-cursors;
    hyprcursor = {
      enable = true;
      size = 32;
    };
  };
}
