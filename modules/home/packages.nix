{ pkgs, ... }:
{

  config = {
    home = {
      packages = with pkgs; [
        wezterm
	neovim
	tldr
	spotify
	discord
	tree
	fastfetch
      ];


    };

  };

}
