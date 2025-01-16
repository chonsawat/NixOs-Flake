{
  # ====================================================
  # Nvim-Cursorline
  # ----------------------------------------------------
  vim.visuals.nvim-cursorline = {
    enable = true;
    setupOpts = {
      cursorline.enable = true;
      cursorword = {
        enable = true;
        hl.underline = true;
      };
    };
  };
}
