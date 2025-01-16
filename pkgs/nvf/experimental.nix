{ pkgs, lib, ... }:
let
  xx = import ./config/keymaps { inherit pkgs; };
  xy = import ./default.nix { inherit pkgs; };

  experiment = {
    imports = [
      (import ./config/visuals)
      (import ./config/options)
      (import ./plugins/oil { inherit pkgs; })
      (import ./plugins/gitsign)
      (import ./plugins/noice)
      (import ./plugins/notify)
      (import ./plugins/telescope)
      (import ./plugins/lsp)
      (import ./plugins/indent-blankline)
      (import ./plugins/cinnamon)
      (import ./plugins/cursorline)
      (import ./plugins/nvimTree)
      (import ./plugins/toggleterm)
      (import ./plugins/lualine)
      (import ./plugins/lazy { inherit pkgs; })
      (import ./themes/cyberdream { inherit pkgs; })
    ];
    vim.lazy.plugins = with pkgs.vimPlugins; {
      ${snacks-nvim.pname} = {
        package = snacks-nvim;
        enabled = true;
      };
    };
  };

  default = lib.attrsets.recursiveUpdate xx.programs.nvf.settings xy.programs.nvf.settings;
  result = lib.attrsets.recursiveUpdate default experiment;
in
result
