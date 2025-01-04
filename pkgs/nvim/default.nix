{ pkgs, ... }:

{
  programs.neovim = let
    ToLua = str: ''
      lua << EOF
      ${str}
      EOF
    '';
    ToLuaFile = file_path: ''
      lua << EOF
      ${builtins.readFile file_path}
      EOF
    '';
  in {

    # Extra package to install
    extraPackages = with pkgs; [ 
        wl-clipboard
    ];

    # Global configuration
    extraLuaConfig = ''
      ${builtins.readFile ./config/keymaps.lua}
      ${builtins.readFile ./config/options.lua}
    '';

    plugins = with pkgs.vimPlugins; [
      # autocmd
      plenary-nvim
      nvim-notify
      cmp_luasnip
      cmp-nvim-lsp
      luasnip
      nvim-dap-ui
      {
        plugin = nvim-autopairs;
        config = ToLuaFile ./config/plugins/auto-pairs.lua;
      }
      # codicons
      {
        plugin = cyberdream-nvim;
        config = ToLuaFile ./config/ui/cyberdream.lua;
      }
      {
        plugin = vim-floaterm;
        config = ToLuaFile ./config/plugins/floaterm.lua;
      }
      {
        plugin = fugitive;
        config = ToLuaFile ./config/plugins/fugitive.lua;
      }
      {
        plugin = gitsigns-nvim;
        config = ToLuaFile ./config/plugins/gitsigns.lua;
      }
      {
        plugin = harpoon2;
        config = ToLuaFile ./config/plugins/harpoon.lua;
      }
      {
        plugin = indent-blankline-nvim;
        config = ToLuaFile ./config/plugins/indent-blankline.lua;
      }
      {
        plugin = lualine-nvim;
        config = ToLuaFile ./config/plugins/indent-blankline.lua;
      }
      {
        plugin = lualine-nvim;
        config = ToLuaFile ./config/plugins/indent-blankline.lua;
      }
      leap-nvim
      mason-nvim
      {
        plugin = mason-nvim-dap-nvim;
        config = ToLuaFile ./config/plugins/mason-nvim-dap.lua;
      }
      {
        plugin = mason-lspconfig-nvim;
        config = ToLuaFile ./config/plugins/mason-nvim-dap.lua;
      }
      {
        plugin = neocord;
        config = ToLuaFile ./config/plugins/neocord.lua;
      }
      {
        plugin = noice-nvim;
        config = ToLuaFile ./config/plugins/noice.lua;
      }
      {
        plugin = none-ls-nvim;
        config = ToLuaFile ./config/plugins/none-ls.lua;
      }
      {
        plugin = nvim-cmp;
        config = ToLuaFile ./config/plugins/nvim-cmp.lua;
      }
      {
        plugin = nvim-dap;
        config = ToLuaFile ./config/plugins/nvim-dap.lua;
      }
      {
        plugin = nvim-lspconfig;
        config = ToLuaFile ./config/plugins/nvim-lspconfig.lua;
      }
      nvim-jdtls
      {
        plugin = nvim-tree-lua;
        config = ToLuaFile ./config/plugins/nvim-tree.lua;
      }
      {
        plugin = nvim-treesitter;
        config = ToLuaFile ./config/plugins/nvim-treesitter.lua;
      }
      (nvim-treesitter.withPlugins (p: [
        p.tree-sitter-nix
        p.tree-sitter-vim
        p.tree-sitter-bash
        p.tree-sitter-lua
        p.tree-sitter-json
        p.tree-sitter-java
        p.tree-sitter-rust
      ]))
      {
        plugin = snacks-nvim;
        config = ToLuaFile ./config/plugins/snacks-nvim.lua;
      }
      outline-nvim
      {
        plugin = telescope-nvim;
        config = ToLuaFile ./config/plugins/telescope.lua;
      }
      {
        plugin = telescope-ui-select-nvim;
        config = ToLuaFile ./config/plugins/telescope-ui-select.lua;
      }
      {
        plugin = which-key-nvim;
        config = ToLuaFile ./config/plugins/which-key-opts.lua;
      }
      telescope-project-nvim
      vim-nix
    ];
  };
}
