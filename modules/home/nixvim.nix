{
  pkgs,
  lib,
  ...
}: {
  programs.neovim.enable = false;
  programs.nixvim = {
    enable = true;
    extraPackages = with pkgs; [
      alejandra
      nixd
    ];

    globals = {
      have_nerd_font = true;
    };

    opts = {
      autoindent = true;
      smartindent = false;
      cindent = false;

      expandtab = true;
      tabstop = 4;
      shiftwidth = 4;
      softtabstop = 4;
      syntax = "on";
      termguicolors = true;

      number = true;
      relativenumber = true;

      list = true;
      listchars = {
        space = "\\u00B7";
        tab = "\\u21A6\\u0020";
        trail = "\\u00B7";
        nbsp = "\\u2420";
        eol = "\\u21B2";
        extends = "\\u2026";
        precedes = "\\u2026";
      };
    };

    colorschemes.catppuccin = {
      enable = true;
    };

    plugins = {
      web-devicons.enable = true;
      lsp = {
        enable = true;
        servers = {
          nixd = {
            enable = true;

            settings = {
              formatting = {
                command = null;
              };
            };
          };
        };
      };
      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            lsp_fallback = true;
            timeout_ms = 2000;
          };
          formatters_by_ft = {
            nix = ["alejandra"];
          };
          formatters = {
            alejandra.command = lib.getExe pkgs.alejandra;
          };
        };
      };

      treesitter = {
        enable = true;
        nixGrammars = true;

        settings = {
          autoLoad = true;
          indent.enable = true;
          highlight.enable = true;
        };
      };
    };
  };
}
