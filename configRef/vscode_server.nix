# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      (fetchTarball "https://github.com/nix-community/nixos-vscode-server/tarball/master")
    ];

  services.vscode-server.enable = true;

}

