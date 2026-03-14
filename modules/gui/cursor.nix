{ pkgs, ... }:
{
  hm.home.pointerCursor = {
    name = "phinger-cursors-dark";
    package = pkgs.phinger-cursors;
    hyprcursor = {
      enable = true;
      size = 32;
    };
  };
}
