{ ... }:
{
  programs = {
    _1password.enable = true;
    _1password-gui.enable = true;
  };

  environment.etc = {
    "1password/custom_allowed_browsers" = {
      text = ''
        librewolf
      '';
      mode = "0755";
    };
  };
}
