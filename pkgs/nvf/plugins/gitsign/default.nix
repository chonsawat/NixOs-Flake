{
  vim.git.gitsigns.enable = true;
  vim.git.gitsigns.setupOpts = {
    signs = {
      add = {text = "+";};
      change = {text = "~";};
      delete = {text = "_";};
      topdelete = {text = "‾";};
      changedelete = {text = "~";};
    };
  };
}
