{ pkgs, lib, ... }:
let
  xx = import ./config/keymaps.nix { inherit pkgs; };
  xy = import ./default.nix { inherit pkgs; };

  experiment = {
    imports = [
      (import ./plugins/oil { inherit pkgs; })
    ];
    vim.lazy.plugins = with pkgs.vimPlugins; {
      ${snacks-nvim.pname} = {
        package = snacks-nvim;
        enabled = true;
        
        # after = ''
        #   local Snacks = require("snacks")
        #   print(string.format("Snacks was loadding ... %s", Snacks.did_setup))
        #   Snacks.setup({dashboard = {enabled = true}})
        #   for key,value in pairs(Snacks) do
        #     print("Found member: " .. key)
        #   end
        #   for k,v in pairs(Snacks.config) do
        #       print(k.." = "..v)
        #   end
        #   print(string.format("Snacks was loadding ... %s", Snacks.did_setup))
        #   print(string.format("Snacks was loadding enter ... %s", Snacks.did_setup_after_vim_enter))
        # '';
      };
    };

  };

  default = lib.attrsets.recursiveUpdate xx.programs.nvf.settings xy.programs.nvf.settings;
  result = lib.attrsets.recursiveUpdate default experiment;
in
result
