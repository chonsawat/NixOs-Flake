{ pkgs, ... }:
{

  imports = [
    ./config/keymaps
  ];

  programs.nvf.settings = {

    imports = [
      (import ./config/visuals)
      (import ./config/options)
      (import ./plugins/oil { inherit pkgs; })
      (import ./plugins/gitsign)
      (import ./plugins/noice)
      (import ./plugins/notify)
      (import ./plugins/telescope)
      (import ./plugins/lsp)
      (import ./plugins/indent-blankline)
      (import ./plugins/cinnamon)
      (import ./plugins/cursorline)
      (import ./plugins/nvimTree)
      (import ./plugins/toggleterm)
      (import ./plugins/lualine)
      (import ./plugins/lazy { inherit pkgs; })
      (import ./themes/cyberdream { inherit pkgs; })
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
      # AI assistance
      # ----------------------------------------------------
      # vim.assistant.copilot = {
      #   enable = true;
      #   cmp.enable = true;
      # };

      # ====================================================
      # Themes
      # ----------------------------------------------------
      # theme = {
      #   enable = true;
      #   # name = "dracula";
      #   name = "gruvbox";
      #   transparent = true;
      #   style = "dark";
      # };

      # ====================================================
      #  Set Loading Sequence
      # ----------------------------------------------------
      # extraPlugins = with pkgs.vimPlugins; {
      #   indent-blankline-nvim = {
      #     package = indent-blankline-nvim;
      #     after = [ "dashboard-nvim" ];
      #   };
      # };
    };
  };
}
