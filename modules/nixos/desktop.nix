{ pkgs, ... }:
{

  config = {

    hardware.graphics.enable = true;

    programs.hyprland.enable = true;

    programs.xwayland.enable = true;

    environment.systemPackages = with pkgs; [
      mako
      hyprpolkitagent
      qt5-wayland
      qt6-wayland
    ];

    services.gnome.gnome-keyring.enable = true;

  };

}
