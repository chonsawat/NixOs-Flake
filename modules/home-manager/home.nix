{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "nixos";
  home.homeDirectory = "/home/nixos";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [

    # Required for neovim as editor
    pkgs.gh
    pkgs.libgit2
    pkgs.dialog
    pkgs.ripgrep
    pkgs.unzip
    pkgs.gnumake
    pkgs.zig

    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello
    pkgs.firefox

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';

    # Wait for understand
    # ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "/home/nixos/.config/nvim";
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/nixos/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
    GEMINI_API_KEY = "AIzaSyB2TKmx0pjELg6aEAmtkYCNkSx0o7mUfHA";
  };

  # Chonsawat add new Programs
  programs.git.enable = true;
  programs.git.userName = "chonsawat";
  programs.git.userEmail = "chonsawat.nakanam@kkumail.com";

  programs.fzf.enable = true;
  programs.starship.enable = true;

  programs.bash.enable = true;
  programs.bash.enableCompletion = true;
  programs.bash.bashrcExtra = ''
    alias nvim-bk="NVIM_APPNAME=Backup-nvim nvim"
    alias nvim-nvchad="NVIM_APPNAME=NvChad nvim"
  '';
  programs.bash.shellAliases = {
    vi = "nvim";
    vim = "nvim";
  };

  programs.nixvim.enable = true;
  programs.nixvim.viAlias = true;
  programs.nixvim.extraPackages = with pkgs; [ wl-clipboard ];
  programs.nixvim.extraConfigLua = ''
    ${builtins.readFile ../../nvim/keymaps.lua}
    ${builtins.readFile ../../nvim/options.lua}
  '';
  programs.nixvim.colorschemes.cyberdream.enable = true;
  programs.nixvim.colorschemes.cyberdream.settings = { transparent = true; };
  # programs.nixvim = let
  #   toLua = str: ''
  #     lua << EOF
  #     ${str}
  #     EOF
  #   '';
  #   toLuaFile = file: ''
  #     lua << EOF
  #     ${builtins.readFile file}
  #     EOF
  #   '';
  # in {
  #   enable = true;
  #
  #   viAlias = true;
  #   vimAlias = true;
  #
  #   extraPackages = with pkgs; [ wl-clipboard ];
  #
  #   extraConfigLua = ''
  #     ${builtins.readFile ../../nvim/keymaps.lua}
  #     ${builtins.readFile ../../nvim/options.lua}
  #   '';
  #
  #   plugins = with pkgs.vimPlugins; [
  #
  #     {
  #       plugin = cyberdream-nvim;
  #       config = toLuaFile ../../nvim/plugins/cyberdream.lua;
  #     }
  #
  #     neodev-nvim
  #     comment-nvim
  #
  #     {
  #       plugin = telescope-nvim;
  #       config = toLuaFile ../../nvim/plugins/telescope.lua;
  #     }
  #     telescope-fzf-native-nvim
  #
  #     cmp_luasnip
  #     cmp-nvim-lsp
  #
  #     vim-nix
  #
  #     nvim-cmp
  #     {
  #       plugin = nvim-tree-lua;
  #       config = toLuaFile ../../nvim/plugins/nvim-tree.lua;
  #     }
  #     nvim-lspconfig
  #     {
  #       plugin = vim-floaterm;
  #       config = toLuaFile ../../nvim/plugins/floaterm.lua;
  #     }
  #
  #     luasnip
  #     lualine-nvim
  #
  #     friendly-snippets
  #     nvim-web-devicons
  #
  #     (nvim-treesitter.withPlugins (p: [
  #       p.tree-sitter-nix
  #       p.tree-sitter-bash
  #       p.tree-sitter-vim
  #       p.tree-sitter-lua
  #       p.tree-sitter-json
  #     ]))
  #
  #   ];
  # };

  services.ssh-agent.enable = true;

  nixpkgs.config = {
    allowUnfreePredicate = pkg:
      builtins.elem (pkgs.lib.getName pkg) [ "discord" ];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
