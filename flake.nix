{
  description = "A very basic flake";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };
    nixpkgs_stable = {
      url = "github:nixos/nixpkgs?ref=nixos-24.05";
    };
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };

  outputs = { self, nixpkgs, nixpkgs_stable, nixos-wsl, ... } @ inputs :
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    pkgs_stable = nixpkgs_stable.legacyPackages.x86_64-linux;
  in
  {
    packages.x86_64-linux.hello = pkgs.hello;

    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

    devShells.x86_64-linux.default = pkgs.mkShell {
      buildInputs = [
        pkgs.neovim
      ];
    };

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
             nixos-wsl.nixosModules.default {
                system.stateVersion = "24.05";
                wsl.enable = true;
             }
            ./configuration.nix
        ];
    };
  };
}
