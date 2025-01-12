## NixOs-Flake
Setup file for personal WSL2

## Requirement
Must have Nix WSL2 on windows
[https://github.com/nix-community/NixOS-WSL](https://github.com/nix-community/NixOS-WSL)

## Installation
Open terminal with wsl
```sh
wsl
```

Clone Nixos with flakes configuation into `~/` or `/home/nixos/flake`
```sh
git clone https://github.com/chonsawat/NixOs-Flake.git ~/flake
```

## Build System
Nixos system 
```sh
sudo nixos-rebuild switch --flake ~/flake
```
or
Home-manager
```sh
home-manager switch --flake ~/flake
```

## Programs
Neovim (`nvim` or `vi`)
```
nvim
```

Neovim but load config from `~/flake/pkgs/nvf/experiment.nix` using for quickly add a new plugin
```
nix run ~/flake
```

## Preview 
Example of configuration tree
![image](https://github.com/user-attachments/assets/7fd1ee82-8fdf-444e-adbb-63a2aaab75fb)
![image](https://github.com/user-attachments/assets/deca3f95-9d7b-4f6e-b6e2-92bc3059d234)
![image](https://github.com/user-attachments/assets/0e691786-82b1-43cf-bada-0555bb467317)
![image](https://github.com/user-attachments/assets/03e51447-d9d1-4c21-81b1-9198cf50374f)

