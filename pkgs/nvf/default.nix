{ pkgs, ... }:
{

  imports = [
    ./config/keymaps.nix
  ];

  programs.nvf.settings = {

    imports = [
      (import ./plugins/oil { inherit pkgs; })
    ];

    vim = {

      # ====================================================
      # Settings
      # ----------------------------------------------------
      useSystemClipboard = true;
      # dashboard.dashboard-nvim.enable = true;
      utility.motion.leap.enable = true;
      treesitter.enable = true;
      autocomplete.nvim-cmp.enable = true;
      binds.whichKey.enable = true;
      comments.comment-nvim = {
        enable = true;
      };
      ui.borders.plugins.nvim-cmp = {
        enable = true;
        style = "rounded";
      };

      # ====================================================
      # Telescope
      # ----------------------------------------------------
      telescope = {
        enable = true;
        setupOpts = {
          defaults = {
            color_devicons = true;
            layout_config.vertical.mirror = true;
            winblend = 1;
          };
        };
      };

      # ====================================================
      # AI assistance
      # ----------------------------------------------------
      # vim.assistant.copilot = {
      #   enable = true;
      #   cmp.enable = true;
      # };

      # ====================================================
      # Themes
      # ----------------------------------------------------
      theme = {
        enable = true;
        name = "dracula";
        transparent = true;
        # style = "darker";
      };

      # ====================================================
      # Language
      # ----------------------------------------------------
      languages = {
        enableLSP = true;
        enableTreesitter = true;

        # ====================================================
        # Java language
        # ----------------------------------------------------
        java = {
          enable = true;
          lsp.enable = true;
          treesitter.enable = true;
        };
        html.treesitter.autotagHtml = true;

        # ====================================================
        # Nix language
        # ----------------------------------------------------
        nix = {
          enable = true;
          lsp.enable = true;
          format.enable = true;
          format.type = "nixfmt";
          extraDiagnostics.enable = true;
          treesitter.enable = true;
        };
      };

      # ====================================================
      #  Indent Blankline
      # ----------------------------------------------------
      visuals = {
        # ====================================================
        # Visual setiings
        # ----------------------------------------------------
        nvim-scrollbar.enable = true;
        nvim-web-devicons.enable = true;
        # ====================================================
        # Indent Blankline
        # ----------------------------------------------------
        indent-blankline = {
          enable = true;
          setupOpts = {
            scope = {
              enabled = true;
              exclude.node_type = {
                "*" = [ "terminal" ];
              };
            };
          };
        };

        # ====================================================
        #  Cinnamon-nvim
        # ----------------------------------------------------
        cinnamon-nvim = {
          enable = true;
          setupOpts.keymaps = {
            basic = true;
            extra = true;
          };
        };

        # ====================================================
        # Nvim-Cursorline
        # ----------------------------------------------------
        nvim-cursorline = {
          enable = true;
          setupOpts = {
            cursorline.enable = true;
            cursorword = {
              enable = true;
              hl.underline = true;
            };
          };
        };

      };

      # ====================================================
      # Noice
      # ----------------------------------------------------
      ui = {
        noice = {
          enable = true;
          setupOpts.lsp.signature.enabled = true;
          setupOpts.presets.lsp_doc_border = true;
        };
      };

      # ====================================================
      #  Toggle terminal
      # ----------------------------------------------------
      terminal.toggleterm.enable = true;
      terminal.toggleterm.setupOpts.direction = "float";

      # ====================================================
      # Lualine
      # ----------------------------------------------------
      statusline.lualine.enable = true;
      statusline.lualine.theme = "powerline";

      # ====================================================
      # Toggle terminal
      # ----------------------------------------------------
      filetree = {
        nvimTree = {
          enable = true;
          openOnSetup = true;
          setupOpts = {
            actions.change_dir.enable = true;
            renderer.highlight_git = true;
            renderer.indent_markers.enable = true;
            sync_root_with_cwd = true;
            actions.open_file.resize_window = true;
            tab.sync.close = true;
            git.enable = true;
          };
        };
      };
      # vim.filetree.nvimTree.setupOpts.renderer.icons.show.modified = true;
      # vim.filetree.nvimTree.setupOpts.view.float.enable = true;

      # ====================================================
      #  Set Loading Sequence
      # ----------------------------------------------------
      # extraPlugins = with pkgs.vimPlugins; {
      #   indent-blankline-nvim = {
      #     package = indent-blankline-nvim;
      #     after = [ "dashboard-nvim" ];
      #   };
      # };

      # ====================================================
      #  Lazy Plugins
      # ----------------------------------------------------
      lazy.enable = true;
      lazy.plugins = {
        ${pkgs.vimPlugins.vim-bbye.pname} = {
          package = pkgs.vimPlugins.vim-bbye;
          cmd = [
            "Bdelete"
            "Bwipeout"
          ];
        };

        ${pkgs.vimPlugins.vim-floaterm.pname} = {
          package = pkgs.vimPlugins.vim-floaterm;
        };
      };
    };
  };
}
