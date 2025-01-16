{
  # ====================================================
  # Telescope
  # ----------------------------------------------------
  vim.telescope = {
    enable = true;
    setupOpts = {
      defaults = {
        color_devicons = true;
        layout_config.vertical.mirror = true;
        winblend = 1;
      };
    };
  };
}
