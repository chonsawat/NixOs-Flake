# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ../../modules/nixos/java.nix
    ../../modules/nixos/node_js.nix
    ../../modules/nixos/vscode_server.nix
    ../../modules/nixos/c-compiler.nix
  ];

  environment.systemPackages = with pkgs; [
    wget
    git
    gh
    libgit2
    neovim
    dialog
    ripgrep
    unzip
    gnumake

    zig
    tree
    home-manager
  ];

  environment.variables = { };

  environment.shellAliases = {
    nvim-bk = "NVIM_APPNAME=Backup-nvim nvim";
    nvim-nvchad = "NVIM_APPNAME=NvChad nvim";
  };

  # Allow un-free package
  nixpkgs.config = { allowUnfree = true; };

  # Nix-ld
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs;
    [
      # Add any missing dynamic libraries for unpackaged programs
      # here, NOT in environment.systemPackages
      libgit2
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.openssh.enable = true;

}
