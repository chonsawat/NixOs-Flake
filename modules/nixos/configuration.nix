# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ../../pkgs/code/java.nix
    ../../pkgs/code/node_js.nix
    ../../pkgs/code/vscode_server.nix
    ../../pkgs/code/c-compiler.nix
  ];

  environment.systemPackages = with pkgs; [ wget git unzip tree home-manager ];

  environment.variables = { };

  environment.shellAliases = { };

  # Allow un-free package
  # nixpkgs.config = { allowUnfree = true; };

  # Nix-ld
  # programs.nix-ld.enable = true;
  # programs.nix-ld.libraries = with pkgs;
  #   [
  #     # Add any missing dynamic libraries for unpackaged programs
  #     # here, NOT in environment.systemPackages
  #     libgit2
  #   ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # services.openssh.enable = true;

}
