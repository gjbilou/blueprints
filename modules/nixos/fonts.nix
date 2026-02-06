{ pkgs, ... }:
{

  config = {
    fonts = {
      enableDefaultPackages = true;

      packages = with pkgs; [
        noto-fonts
        noto-fonts-color-emoji
        nerd-fonts.nerd-fonts.jetbrains-mono
        nerd-fonts.fira-code
      ];

      fontconfig = {
        enable = true;
	defaultFonts = {
	  sansSerif = [ "Noto Sans" ];
	  serif = [ "Noto Serif" ];
	  monospace = [ "FiraCode Nerd Font" ];
	  emoji = [ "Noto Color Emoji" ];
	};
      };

    };
  };

}
