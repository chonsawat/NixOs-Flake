{ config, pkgs, ... }:

let
  ToLua = str: ''
    lua <<EOF
            ${str}
        EOF'';
  ToLuaFile = file_path: ''
    lua <<EOF
            ${builtins.readFile file_path}
        EOF'';
in {

  imports = [ ./config/keymaps.nix ];

  programs.nixvim = {

    # Extra package to install
    extraPackages = with pkgs; [ wl-clipboard ];

    # Global configuration
    extraConfigLua = ''
      ${builtins.readFile ./config/keymaps.lua}
      ${builtins.readFile ./config/options.lua}

      ${builtins.readFile ./config/plugins/indent-blank.lua}
      ${builtins.readFile ./config/plugins/floaterm.lua}
    '';

    # Colorscheme
    colorschemes.cyberdream.enable = true;
    colorschemes.cyberdream.settings = {
      borderless_telescope = true;
      hide_fillchars = true;
      italic_comments = true;
      terminal_colors = true;
      theme = {
        colors = {
          bg = "#000000";
          green = "#00ff00";
          magenta = "#ff00ff";
        };
        highlights = {
          Comment = {
            bg = "NONE";
            fg = "#696969";
            italic = true;
          };
        };
      };
      transparent = true;
    };

    # Plugins telescope
    plugins.telescope.enable = true;
    plugins.telescope.highlightTheme = "cyberdream";
    plugins.telescope.keymaps = {
      "<C-p>" = {
        action = "git_files";
        options = { desc = "Telescope Git Files"; };
      };
      "<leader>fg" = "live_grep";
      "<leader>ff" = "find_files";
      "<leader>fd" = "diagnostics";
      "<leader>fr" = "resume";
      "<leader>f." = "oldfiles";
      "<leader>fb" = "buffers";
      "<leader>fc" = "colorscheme";

      "<leader>gC" = "git_commits";
      "<leader>gf" = "git_files";
      "<leader>gs" = "git_stash";
      "<leader>gt" = "git_status";
    };
    plugins.web-devicons.enable = true;
    plugins.telescope.extensions.ui-select.enable = true;
    plugins.telescope.extensions.ui-select.settings.keymaps = {
      "<C-n>" = "cycle_history_next";
      "<C-p>" = "cycle_history_prev";
      "<C-j>" = "move_selection_next";
      "<C-k>" = "move_selection_previous";
    };
    plugins.telescope.luaConfig.content = ''
              local actions = require("telescope.actions")
              require("telescope").setup({
                  extensions = {
                  ["ui-select"] = {
                      require("telescope.themes").get_dropdown {}
                  }
              },
                  require("telescope").load_extension("ui-select")
              })
      --        require("telescope").load_extension "macros"
      --        vim.keymap.set("n", "<space>m", "<cmd>Telescope macros<cr>")
    '';

    # Plugins lsp
    plugins.lsp.enable = true;
    plugins.lsp.servers = {
      nixd.enable = true;
      lua_ls.enable = true;

      # Typescript
      ts_ls.enable = true;

      # Rust
      rust_analyzer.enable = true;
      rust_analyzer.installCargo = false;
      rust_analyzer.installRustc = false;
    };
    plugins.lsp.keymaps = {
      diagnostic = {
        "<leader>j" = "goto_next";
        "<leader>k" = "goto_prev";
      };
      lspBuf = {
        K = "hover";
        cD = "references";
        cd = "definition";
        ci = "implementation";
        ct = "type_definition";
      };
    };

    # Plugins Snack
    plugins.snacks.enable = true;
    plugins.snacks.settings = {
      bigfile = { enabled = false; };
      statuscolumn = { enabled = false; };
      words = {
        enabled = true;
        debounce = 100;
      };
      quickfile = { enabled = false; };
      notifier = {
        enabled = true;
        timeout = 3000;
      };
    };
    plugins.snacks.settings.config = {
      header = [
        "███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗"
        "████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║"
        "██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║"
        "██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║"
        "██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║"
        "╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
      ];
    };

    # Plugins nvim-cmp
    plugins.cmp.enable = true;
    plugins.cmp.autoEnableSources = true;
    plugins.cmp.settings.sources =
      [ { name = "nvim_lsp"; } { name = "path"; } { name = "buffer"; } ];
    plugins.cmp.settings.mapping = {
      "<C-d>" = "cmp.mapping.scroll_docs(-4)";
      "<C-f>" = "cmp.mapping.scroll_docs(4)";
      "<C-Space>" = "cmp.mapping.complete()";
      "<C-e>" = "cmp.mapping.close()";
      "<C-j>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
      "<C-k>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
      "<CR>" = "cmp.mapping.confirm({ select = true })";
    };

    # Plugin nvim-tree
    plugins.nvim-tree.enable = true;
    plugins.nvim-tree.hijackCursor = true;
    plugins.nvim-tree.reloadOnBufenter = true;

    # Plugin neoscroll
    plugins.neoscroll.enable = true;
    plugins.neoscroll.autoLoad = true;
    plugins.neoscroll.settings = {
      mappings = [ "<C-u>" "<C-d>" "<C-b>" "<C-f>" "<C-y>" "zt" "zz" "zb" ];
      performance_mode = false;
    };

    # Dashboard
    # plugins.dashboard.enable = true;

    # Which key
    plugins.which-key.enable = true;

    # Gitsign
    plugins.gitsigns.enable = true;

    # Harpoon
    plugins.harpoon.enable = true;
    plugins.harpoon.enableTelescope = true;
    plugins.harpoon.keymaps = {
      addFile = "<S-m>";
      toggleQuickMenu = "<Tab>";
      navNext = "h]";
      navPrev = "h[";
    };

    # Lualine
    plugins.lualine.enable = true;

    # Fugitive
    plugins.fugitive.enable = true;

    # Comment
    plugins.comment.enable = true;
    plugins.comment.settings = {
      toggler = {
        line = "<leader>/";
        block = "<leader>/";
      };
    };

    # Floaterm
    plugins.floaterm.enable = true;
    plugins.floaterm.settings = {
      wintype = "float";
      position = "bottomright";
      keymap_new = "<Leader>ft";
      keymap_prev = "<Leader>fp";
      keymap_next = "<Leader>fn";
      keymap_toggle = "<Leader>t";
      keymap_kill = "<Leader>fk";
    };

    plugins.noice.enable = true;

    plugins.indent-blankline.enable = true;

    plugins.indent-blankline.settings.exclude.buftypes =
      [ "terminal" "nofile" "quickfix" "prompt" "Dashboard" ];
    plugins.indent-blankline.settings.exclude.filetypes = [
      "Dashboard"
      "lspinfo"
      "packer"
      "checkhealth"
      "help"
      "man"
      "gitcommit"
      "TelescopePrompt"
      "TelescopeResults"
      "''"
    ];

    plugins.lz-n.enable = true;

    plugins.nvim-autopairs.enable = true;

    plugins.treesitter.enable = true;
    plugins.treesitter.grammarPackages =
      with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        bash
        json
        lua
        make
        markdown
        nix
        regex
        vim
        vimdoc
        xml
        java
        rust
      ];
    plugins.treesitter.settings.ensure_installed =
      [ "nix" "vim" "lua" "java" "rust" "html" "css" "json" "tsx" ];

    plugins.neocord.enable = true;

  };
}
