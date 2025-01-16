{
  # ====================================================
  # Language
  # ----------------------------------------------------
  vim.languages = {
    enableLSP = true;
    enableTreesitter = true;

    # ====================================================
    # Java language
    # ----------------------------------------------------
    java = {
      enable = true;
      lsp.enable = true;
      treesitter.enable = true;
    };
    html.treesitter.autotagHtml = true;

    # ====================================================
    # Nix language
    # ----------------------------------------------------
    nix = {
      enable = true;
      lsp.enable = true;
      format.enable = true;
      format.type = "nixfmt";
      extraDiagnostics.enable = true;
      treesitter.enable = true;
    };
  };
}
