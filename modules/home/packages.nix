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

        git
	gnumake
	unzip
	gcc

	ripgrep
	fd
	wl-clipboard
	
	go
	python315
	uv
      ];

    };

  };

}
