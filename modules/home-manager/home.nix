{ config, pkgs, inputs, ... }:

let
    Link = config.lib.file.mkOutOfStoreSymlink;
in{
  imports = [ 
    (import ../../pkgs/nvim { 
        inherit pkgs;
      } 
    ) 
    # ../../pkgs/nvim
  ];
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

    ".config/nvim-home" = {
        source = Link ../../pkgs/nvim;
        recursive = true; 
    };
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
    GEMINI_API_KEY = "";
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
    alias nvim-chonsawat="NVIM_APPNAME=nvim-chonsawat nvim"
  '';
  programs.bash.shellAliases = {
    vi  = "nvim-chonsawat";
    vim = "nvim-chonsawat";
  };

  # Neovim 
  # Setup : ~/flake/pkgs/nvim/default.nix
  programs.neovim.enable = true;

  services.ssh-agent.enable = true;

  nixpkgs.config = {
    allowUnfreePredicate = pkg:
      builtins.elem (pkgs.lib.getName pkg) [ "discord" ];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
