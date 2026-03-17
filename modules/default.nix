{ ... }:
{
  imports = [
    ./gui
    ./cli

    ./home-manager.nix
    ./packages.nix
    ./unfree.nix
    ./keyring.nix
  ];
}
