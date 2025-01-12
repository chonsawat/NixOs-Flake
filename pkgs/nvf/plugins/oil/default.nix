{ pkgs }:
{
  vim.lazy.plugins = with pkgs.vimPlugins; {
    ${oil-nvim.pname} = {
      package = oil-nvim;
      event = [ "BufEnter" ];
      # setupModule = "oil";
      # setupOpts = {
      #   use_default_keymaps = false;
      # };
      after = ''require("oil").setup({
        use_default_keymaps = false,
        keymaps = {
          ["g?"] = { "actions.show_help", mode = "n" },
          ["<CR>"] = "actions.select",
          ["<tab>"] = "actions.select",
          ["<C-V>"] = { "actions.select", opts = { vertical = true } },
          ["<C-x>"] = { "actions.select", opts = { horizontal = true } },
          ["<C-p>"] = "actions.preview",
          ["<C-c>"] = { "actions.close", mode = "n" },
          ["<leader><C-l>"] = "actions.refresh",
          ["-"] = { "actions.parent", mode = "n" },
          ["_"] = { "actions.open_cwd", mode = "n" },
          ["g."] = { "actions.toggle_hidden", mode = "n" },
          ["g\\"] = { "actions.toggle_trash", mode = "n" },

          -- Comments
          -- ["`"] = { "actions.cd", mode = "n" },
        },
      })'';
      keys = let
        # setKey = key: action: {inherit key action; };
        setKeyWithMode = mode: key: action: { inherit key action mode; };
      in [
        (setKeyWithMode "n" "<leader>-" "<cmd>Oil<CR>")
      ];
    };
  };
}
