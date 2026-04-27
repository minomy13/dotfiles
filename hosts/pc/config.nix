{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./openlinkhub
  ];

  environment.systemPackages = with pkgs; [
    usbutils
  ];

  networking.hostName = "nixos";

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement = {
      enable = false;
      finegrained = false;
    };
    open = true;
    nvidiaSettings = true;
  };

  virtualisation.docker.enable = true;
  virtualisation.docker.daemon.settings = {
    userland-proxy = false;
  };

  users.users.adrian = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "docker"
    ];
  };

  gaming.minecraft.enable = true;

  system.stateVersion = "25.11"; # Did you read the comment?
}
