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
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-ld = {
      url = "github:Mic92/nix-ld";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs_stable,
      nixos-wsl,
      home-manager,
      nix-ld,
      nvf,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs_unfree = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs_stable = nixpkgs_stable.legacyPackages.${system};
      modulePaths = builtins.toString ./.;
    in
    {

      packages.${system}.default =
        (nvf.lib.neovimConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          modules = [ ./pkgs/nvf/experimental.nix ];
        }).neovim;
      devShells = {

        ${system}.default = pkgs.mkShell { buildInputs = [ ]; };

        ${system}.discord = pkgs.mkShell { buildInputs = [ pkgs_unfree.discord ]; };

        ${system}.rust =
          let
            overrides = builtins.fromTOML (builtins.readFile "${toString ./utils/rust-toolchain.toml}");
            libPath = with pkgs; lib.makeLibraryPath [ ];
          in
          pkgs.mkShell {
            buildInputs = with pkgs; [
              clang
              llvmPackages.bintools
              rustup
            ];

            RUSTC_VERSION = overrides.toolchain.channel;
            LIBCLANG_PATH = pkgs.lib.makeLibraryPath [ pkgs.llvmPackages_latest.libclang.lib ];

            shellHook = ''
              export PATH=$PATH:''${CARGO_HOME:-~/.cargo}/bin
              export PATH=$PATH:''${RUSTUP_HOME:-~/.rustup}/toolchains/$RUSTC_VERSION-x86_64-unknown-linux-gnu/bin/
            '';

            RUSTFLAGS = builtins.map (a: "-L ${a}/lib") [ ];
            LD_LIBRARY_PATH = libPath;

            BINDGEN_EXTRA_CLANG_ARGS =
              (builtins.map (a: ''-I"${a}/include"'') [ pkgs.glibc.dev ])

              ++ [
                ''-I"${pkgs.llvmPackages_latest.libclang.lib}/lib/clang/${pkgs.llvmPackages_latest.libclang.version}/include"''
                ''-I"${pkgs.glib.dev}/include/glib-2.0"''
                "-I${pkgs.glib.out}/lib/glib-2.0/include/"
              ];
          };
      };

      formatter.${system} = nixpkgs.legacyPackages.${system}.nixfmt;

      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs home-manager modulePaths; };
        modules = [
          nixos-wsl.nixosModules.default
          {
            system.stateVersion = "24.05";
            wsl.enable = true;
          }
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.nixos = {
                imports = [
                  nvf.homeManagerModules.default
                  ./modules/home-manager/home.nix
                ];
              };

            };
            home-manager.extraSpecialArgs = { inherit modulePaths; };
          }
          nix-ld.nixosModules.nix-ld
          { programs.nix-ld.dev.enable = true; }
          ./modules/nixos/configuration.nix
        ];
      };

      homeConfigurations = {
        nixos = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            nvf.homeManagerModules.default
            ./modules/home-manager/home.nix
          ];
          extraSpecialArgs = { inherit inputs modulePaths; };
        };
      };

    };
}
