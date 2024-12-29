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
            ];
        };
 
        devShells.x86_64-linux.rust = let 
            overrides = (builtins.fromTOML (builtins.readFile "${toString ./utils/rust-toolchain.toml}"));
            libPath = with pkgs; lib.makeLibraryPath [
              # load external libraries that you need in your rust project here
            ];
        in pkgs.mkShell {
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

            RUSTFLAGS = (builtins.map (a: ''-L ${a}/lib'') []);
            LD_LIBRARY_PATH = libPath;

            BINDGEN_EXTRA_CLANG_ARGS = (builtins.map (a: ''-I"${a}/include"'') [
                pkgs.glibc.dev
            ])

            ++ [
                ''-I"${pkgs.llvmPackages_latest.libclang.lib}/lib/clang/${pkgs.llvmPackages_latest.libclang.version}/include"''
                ''-I"${pkgs.glib.dev}/include/glib-2.0"''
                ''-I${pkgs.glib.out}/lib/glib-2.0/include/''
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
