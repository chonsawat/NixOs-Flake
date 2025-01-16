
{ pkgs }:
{
  vim.lazy.plugins = with pkgs.vimPlugins; {
    ${cyberdream-nvim.pname} = {
      package = cyberdream-nvim;
      lazy = false;
      priority = 1000;
      event = [ "BufEnter" ];
      setupModule = "cyberdream";
      setupOpts = {
        transparent = true;
        borderless_telescope = false;
        cache = true;
        extensions = {
          telescope = true;
          notify = true;
          mini = true;
        };
        options = {
          colorscheme = "cyberdream";
        };
      };
      after = ''
        vim.cmd("colorscheme cyberdream")
      '';
    };
  };
}
