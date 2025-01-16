{
  # ====================================================
  # NvimTree
  # ----------------------------------------------------
  vim.filetree = {
    nvimTree = {
      enable = true;
      openOnSetup = false;
      setupOpts = {
        actions.change_dir.enable = true;
        renderer.highlight_git = true;
        renderer.indent_markers.enable = true;
        sync_root_with_cwd = true;
        git.enable = true;
      };
    };
  };
}
