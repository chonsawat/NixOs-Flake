# Nixos system rebuild
system-rebuild:
    nixos-rebuild switch --flake ~/flake --use-remote-sudo

system-rebuild-debug:
    nixos-rebuild switch --flake ~/flake --use-remote-sudo --show-trace --verbose

# Home rebuild
home-rebuild:
    home-manager switch --flake ~/flake

# Update flake
up:
  nix flake update
upp:
  nix flake update $(i)

# Manage System
history:
  nix profile history --profile /nix/var/nix/profiles/system

repl:
  nix repl -f flake:nixpkgs

# remove all generations older than 7 days
clean:
    sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d

# Workspace
workspace-java:
	nvim /mnt/d/Coding_spaces/Java/

workspace-rust:
	nvim /mnt/d/Coding_spaces/Rust/

nvim-config:
	nvim ~/.config/nvim

flake-config:
	nvim ~/flake
