# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
    imports =
    [ 
      ./configRef/java.nix
      ./configRef/node_js.nix
      ./configRef/c-compiler.nix
      ({ config, pkgs, ... }: let _ = builtins.trace "Loading additional configuration" "from imported files"; in {})
    ];
  
    environment.systemPackages = with pkgs; let
    in [
        wget
        git
        dialog
        ripgrep
        unzip
    ];

  # Allow un-free package
  nixpkgs.config = {
    allowUnfree = true;
  };

  # Nix-ld
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];
  services.openssh.enable = true;
}

