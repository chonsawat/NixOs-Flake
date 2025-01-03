{ pkgs, ... }: {
  programs.nixvim = {

    # Leader
    globals.mapleader = " ";

    keymaps = [
      # Telescope
      {
        action = "<cmd>Telescope keymaps<CR>";
        key = "<leader>fK";
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
        action = "<cmd>Git blame<CR>";
        key = "<leader>gb";
      }
      {
        action = "<cmd>Git add .<CR>";
        key = "<leader>gA";
      }
      {
        action = "<cmd>Git blame<CR>";
        key = "<leader>gb";
      }
      {
        action = "<cmd>Git commit<CR>";
        key = "<leader>gc";
      }
      {
        action = "<cmd>Git push<CR>";
        key = "<leader>gp";
      }
      {
        action = "<cmd>Git status<CR>";
        key = "<leader>gS";
      }

      # None-LS
      {
        key = "<leader>cf";
        action = "vim.lsp.buf.format";
      }
    ];
  };
}
