{
  lib,
  config,
  inputs,
  ...
}:
{
  options.secureboot.enable = lib.mkEnableOption "Enable secureboot";

  imports = [ inputs.lanzaboote.nixosModules.lanzaboote ];

  config = lib.mkIf config.secureboot.enable {
    boot.loader.systemd-boot.enable = lib.mkForce false;
    boot.lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };
  };
}
