{ pkgs, ... }: {
  programs.nixvim = {

    # Leader
    globals.mapleader = " ";

    keymaps = [
      # Telescope
      {
        action = "<cmd>Telescope keymaps<CR>";
        key = "<leader>fk";
      }

      # NvimTree
      {
        action = "<cmd>NvimTreeToggle<CR>";
        key = "<leader>ee";
      }
      {
        action = "<cmd>NvimTreeRefresh<CR>";
        key = "<leader>er";
      }

      # Fugitive
      {
        key = "<cmd>Git blame<CR>";
        action = "<leader>gb";
      }
      {
        key = "<cmd>Git add .<CR>";
        action = "<leader>gA";
      }
      {
        key = "<cmd>Git blame<CR>";
        action = "<leader>gb";
      }
      {
        key = "<cmd>Git commit<CR>";
        action = "<leader>gc";
      }
      {
        key = "<cmd>Git push<CR>";
        action = "<leader>gp";
      }
      {
        key = "<cmd>Git status<CR>";
        action = "<leader>gS";
      }
    ];
  };
}
