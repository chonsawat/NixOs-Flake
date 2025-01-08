{ config, pkgs, inputs, ... }:

let Link = config.lib.file.mkOutOfStoreSymlink;
in {
  imports = [ ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "nixos";
  home.homeDirectory = "/home/nixos";

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = with pkgs; [

    # Required for neovim as editor
    gh
    libgit2
    dialog
    ripgrep
    unzip
    gnumake
    zig
    just

    # Application
    firefox

    # # Override font
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # Create dir without symlink
    # ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "/home/nixos/.config/nvim";
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager.   
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
    alias nvim-chonsawat="NVIM_APPNAME=nvim-chonsawat nvim"
  '';
  programs.bash.shellAliases = {
    vim = "nvim-chonsawat";
    hs = "home-manager switch --flake ~/flake -b backup-by-home-manager";
    ss = "sudo nixos-rebuid switch --flake ~/flake";
  };

  # Neovim 
  programs.neovim.enable = true;
  programs.nvf.enable = true;
  programs.nvf.settings = { vim.viAlias = true; };

  services.ssh-agent.enable = true;

  nixpkgs.config = {
    allowUnfreePredicate = pkg:
      builtins.elem (pkgs.lib.getName pkg) [ "discord" ];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
