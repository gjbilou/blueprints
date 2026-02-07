{ pkgs, ... }:
{
  imports = [
    # i need to define the profiles that i will import in here
    ./hardware-configuration.nix
    ../../modules/nixos/nix.nix
    ../../modules/nixos/base.nix

    
    ../../modules/nixos/users.nix
    ../../modules/nixos/network.nix
    ../../modules/nixos/packages.nix
    ../../modules/nixos/fonts.nix
    ../../modules/nixos/audio.nix
    ../../modules/nixos/desktop.nix
  ];


  config = {
    boot = {
      kernelPackages = pkgs.linuxPackages_latest;

      loader = {
        systemd-boot.enable = false;
    efi.canTouchEfiVariables = true;

    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
    };
      };
    };

    networking.hostName = "nixy";
  };
}
