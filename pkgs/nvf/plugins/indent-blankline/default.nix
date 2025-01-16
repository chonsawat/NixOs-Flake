{
  # ====================================================
  # Indent Blankline
  # ----------------------------------------------------
  vim.visuals.indent-blankline = {
    enable = true;
    setupOpts = {
      scope = {
        enabled = true;
        exclude.node_type = {
          "*" = [ "terminal" ];
        };
      };
    };
  };
}
