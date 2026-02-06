{ pkgs, ... }:
{

  config = {

    hardware.graphics.enable = true;

    programs.hyprland.enable = true;

    programs.xwayland.enable = true;

    environment.systemPackages = with pkgs; [
      mako
      hyprpolkitagent
      qt5.qtwayland
      qt6.qtwayland
    ];

    services.gnome.gnome-keyring.enable = true;

  };

}
