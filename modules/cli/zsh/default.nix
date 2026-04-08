{ pkgs, ... }:
{
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  hm.programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      vim = "nvim";
      open = "xdg-open";
    };

    profileExtra = ''
      if uwsm check may-start; then
        exec uwsm start hyprland.desktop
      fi
    '';

    history.size = 10000;
  };
}
