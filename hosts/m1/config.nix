{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./apple-silicon-support
  ];

  config = {
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    environment.systemPackages = with pkgs; [
      vim
      brightnessctl
    ];

    networking.hostName = "nixos-m1";

    networking.networkmanager.enable = true;

    time.timeZone = "Europe/Amsterdam";

    users.users.adrian = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };

    system.stateVersion = "25.11"; # Did you read the comment?

    hardware.asahi.peripheralFirmwareDirectory = ./firmware;
    hardware.apple.touchBar.enable = true;

    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };
}
