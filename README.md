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

build Nixos system 
```sh
sudo nixos-rebuild switch --flake ~/flake
```

## Preview 
Example of configuration tree
![image](https://github.com/user-attachments/assets/2c6bcd13-d651-468a-8f7e-2c7018f54ddc)
