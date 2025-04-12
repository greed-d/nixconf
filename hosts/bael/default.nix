{ configs, pkgs, ... }:

{
  imports = [
    # Add hw conf
    ./hardware-configuration.nix

    # add system info
    ../../modules/system.nix

  ];

  boot.loader = {
    efi = { canTouchEfiVariables = true; };
    systemd-boot.enable = true;
  };
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "bael"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;
}
