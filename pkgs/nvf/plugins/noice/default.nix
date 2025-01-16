{
  # ====================================================
  # Noice
  # ----------------------------------------------------
  vim.ui = {
    noice = {
      enable = true;
      setupOpts = {
        lsp = {
          signature.enabled = true;
          # override."cmp.entry.get_documentation" = true;
          override."vim.lsp.util.convert_input_to_markdown_lines" = true;
        };
        presets.lsp_doc_border = true;
      };
    };
  };
}
