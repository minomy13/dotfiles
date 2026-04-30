{ pkgs, inputs, ... }:
{
  imports = [
    inputs.apple-silicon-support.nixosModules.apple-silicon-support
    ./hardware-configuration.nix
  ];

  environment.systemPackages = with pkgs; [
    brightnessctl
  ];

  networking.hostName = "nixos-m1";

  users.users.adrian = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  hardware.apple.touchBar.enable = true;
  hardware.asahi.peripheralFirmwareDirectory = inputs.m1-firmware;

  system.stateVersion = "25.11"; # Did you read the comment?
}
