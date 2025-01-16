{ pkgs }:
{
  # ====================================================
  #  Lazy Plugins
  # ----------------------------------------------------
  vim.lazy.enable = true;
  vim.lazy.plugins = {
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
}
