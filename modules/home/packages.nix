{ pkgs, ... }:
{

  config = {
    home = {
      packages = with pkgs; [
    ghostty
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
	lua-language-server
    tree-sitter
                nodejs
      ];

    };

  };

}
