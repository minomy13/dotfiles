{ lib, pkgs, ... }:
{
  hm.programs.git = {
    enable = true;

    settings = {
      user = {
        name = "minomy13";
        email = "mail@minomy13.com";
      };
      init.defaultBranch = "main";
    };

    extraConfig = {
      gpg = {
        format = "ssh";
      };
      "gpg \"ssh\"" = {
        program = "${lib.getExe' pkgs._1password-gui "op-ssh-sign"}";
      };
      commit = {
        gpgsign = true;
      };
      user = {
        signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO9z58sWX1yAGZgy7YqA5EhEp2CKRx7C9itkxbKJ5DJt";
      };
    };
  };
}
