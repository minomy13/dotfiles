{ inputs, lib, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    (lib.mkAliasOptionModule [ "hm" ] [ "home-manager" "users" "adrian" ])
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    backupFileExtension = "backup";
    users.adrian.imports = [
      {
        home = {
          username = "adrian";
          homeDirectory = "/home/adrian";
          stateVersion = "25.11";
          file = { };
        };
      }
    ];
  };
}
