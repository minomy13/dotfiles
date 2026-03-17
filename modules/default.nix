{ ... }:
{
  imports = [
    ./gui
    ./cli
    ./devices

    ./home-manager.nix
    ./packages.nix
    ./unfree.nix
    ./keyring.nix
    ./gaming.nix
  ];
}
