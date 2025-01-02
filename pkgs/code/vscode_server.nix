# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports = [
    (fetchTarball {
      url =
        "https://github.com/nix-community/nixos-vscode-server/tarball/master";
      sha256 = "09j4kvsxw1d5dvnhbsgih0icbrxqv90nzf0b589rb5z6gnzwjnqf";
    })
  ];

  services.vscode-server.enable = true;
}

