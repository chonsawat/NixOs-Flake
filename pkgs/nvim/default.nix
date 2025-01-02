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
    '';

    # Colorscheme
    colorschemes.cyberdream.enable = true;
    colorschemes.cyberdream.settings = { transparent = true; };

    # Plugins telescope
    plugins.telescope.enable = true;
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
        gD = "references";
        gd = "definition";
        gi = "implementation";
        gt = "type_definition";
      };
    };

    # Plugins Snack
    plugins.snacks.enable = true;

    # Plugins nvim-cmp
    plugins.cmp = {
      enable = true;
      autoEnableSources = true;
    };

    # Plugin nvim-tree
    plugins.nvim-tree.enable = true;
    plugins.nvim-tree.hijackCursor = true;
    plugins.nvim-tree.reloadOnBufenter = true;

    # Plugin neoscroll
    plugins.neoscroll.enable = true;
    plugins.neoscroll.autoLoad = true;

    # Dashboard
    plugins.dashboard.enable = true;

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

  };
}
