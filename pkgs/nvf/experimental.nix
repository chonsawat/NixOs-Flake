{ pkgs, lib, ... }:
let
  xx = import ./config/keymaps.nix { inherit pkgs; };
  xy = import ./default.nix { inherit pkgs; };
  experiment = {
    # ====================================================
    #  Lazy Plugins
    # ----------------------------------------------------
    vim.lazy.plugins = with pkgs.vimPlugins; {
      ${oil-nvim.pname} = {
        package = oil-nvim;
        after = ''require("oil").setup()'';
      };
    };
  };
  default = lib.attrsets.recursiveUpdate xx.programs.nvf.settings xy.programs.nvf.settings;
  result = lib.attrsets.recursiveUpdate default experiment;
in
result
