{pkgs, ...} : 
{

  imports = [ 
    ./config/keymaps.nix 
  ];

  programs.nvf.settings = {

    vim = {
    theme = {
      enable = true;
      name = "dracula";
      transparent = true;
      # style = "darker";
      };
    };

    vim.useSystemClipboard = true;

    # Quick install 
    vim.dashboard.dashboard-nvim.enable = true;
    # vim.visuals.indent-blankline.enable = true;
    # vim.visuals.indent-blankline.setupOpts.scope.enabled = true;
    # vim.visuals.indent-blankline.setupOpts.scope.exclude.vim.visuals.indent-blankline.setupOpts.scope.exclude.buftypes = ["terminal"];

    vim.visuals.nvim-cursorline.enable = true;
    vim.visuals.nvim-cursorline.setupOpts.cursorline.enable = true;
    vim.visuals.nvim-cursorline.setupOpts.cursorword.enable = true;
    vim.visuals.nvim-cursorline.setupOpts.cursorword.hl.underline = true;

    vim.visuals.nvim-scrollbar.enable = true;

    vim.ui.noice.enable = true;

    vim.statusline.lualine.enable = true;
    vim.statusline.lualine.theme = "powerline";

    vim.telescope.enable = true;
    vim.utility.motion.leap.enable = true;

    vim.treesitter.enable = true;

    vim.autocomplete.nvim-cmp.enable = true;

    vim.languages.enableLSP = true;
    vim.languages.enableTreesitter = true;

    vim.languages.nix.enable = true;
    vim.languages.nix.lsp.enable = true;
    vim.languages.nix.format.enable = true;
    vim.languages.nix.format.type = "nixfmt";
    vim.languages.nix.extraDiagnostics.enable = true;
    vim.languages.nix.treesitter.enable = true;

    vim.languages.java.enable = true;
    vim.languages.java.lsp.enable = true;
    vim.languages.java.treesitter.enable = true;
    vim.languages.html.treesitter.autotagHtml = true;

    vim.filetree.nvimTree.enable = true;
    vim.filetree.nvimTree.openOnSetup = false;

    vim.binds.whichKey.enable = true;
    vim.visuals.nvim-web-devicons.enable = true;
    vim.telescope.setupOpts.defaults.color_devicons = true;

    vim.visuals.cinnamon-nvim.enable = true;
    vim.visuals.cinnamon-nvim.setupOpts.keymaps.basic = true;
    vim.visuals.cinnamon-nvim.setupOpts.keymaps.extra = true;

    vim.terminal.toggleterm.enable = true;
    vim.terminal.toggleterm.setupOpts.direction = "float";

    vim.lazy.enable = true;
    vim.lazy.plugins = {
      ${pkgs.vimPlugins.vim-bbye.pname} = {
        package = pkgs.vimPlugins.vim-bbye;
        cmd = ["Bdelete" "Bwipeout"];
      };

      ${pkgs.vimPlugins.vim-floaterm.pname} = {
        package = pkgs.vimPlugins.vim-floaterm;
      };
    };

  };

}
