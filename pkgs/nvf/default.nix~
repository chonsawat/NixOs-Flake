{ pkgs, ... }:
{

  imports = [
    ./config/keymaps
  ];

  programs.nvf.settings = {

    imports = [
      (import ./plugins/oil { inherit pkgs; })
      (import ./plugins/gitsign { inherit pkgs; })
      (import ./plugins/notify { inherit pkgs; })
      (import ./plugins/telescope { inherit pkgs; })
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

      options = {
        shiftwidth = 2;
        tabstop = 2;
        wrap = false;
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
