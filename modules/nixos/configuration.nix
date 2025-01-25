# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ modulePaths, pkgs, ... }:

{
  imports = [
    "${modulePaths}/pkgs/systems/java.nix"
    "${modulePaths}/pkgs/systems/node_js.nix"
    "${modulePaths}/pkgs/systems/vscode_server.nix"
    "${modulePaths}/pkgs/systems/c-compiler.nix"
  ];

  environment = {
    systemPackages = with pkgs; [
      wget
      git
      unzip
      tree
      home-manager
    ];
    variables = { };
    shellAliases = { };
  };

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

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  services.jenkins = {
    enable = true;
    withCLI = true;
  };
  services.nginx = {
    enable = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    virtualHosts = {
      jenkins = {
        serverName = "cjenkins.com";
        serverAliases = [ "cjk.com" ];
        # forceSSL = true;
        # enableACME = true;
        locations = {
          "/" = {
            proxyPass = "http://chonsawat.com:8080/";
          };
        };
      };
    };
  };
  # services.tomcat.enable = true;
  security.acme.acceptTerms = true;
  security.acme.defaults.email = "chonsawat.nakanam@kkumail.com";
  # services.openssh.enable = true;
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [
    80
    443
  ];
}
