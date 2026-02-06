{ pkgs, ... }:
{

  config = {
    hardware.graphics.enable = true;

    programs.niri.enable = true;

    programs.dank-material-shell.enable = true;

    programs.xwayland.enable = true;

    xdg.portal = {
      enable = true;

      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-gnome
      ];

      config.common = {
        "org.freedesktop.impl.portal.FileChooser" = "gtk";
      };
    };

    services.gnome.gnome-keyring.enable = true;

    programs.dconf.enable = true;
    dconf.settings = {
      "org/gnome/desktop/interface" = { color-scheme = "prefer-dark"; };
    };
  };

}
