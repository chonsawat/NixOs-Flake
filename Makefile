java-advent-code:
	nvim /mnt/d/Coding_spaces/Java/advent-code

java-project:
	nvim /mnt/d/Coding_spaces/Java/project/

java-spring:
	nvim /mnt/d/Coding_spaces/Java/spring/

java-udemy:
	nvim /mnt/d/Coding_spaces/Java/udemy/

java-workspace:
	nvim /mnt/d/Coding_spaces/Java/

rust-workspace:
	nvim /mnt/d/Coding_spaces/Rust/

nvim-config:
	nvim ~/.config/nvim

flake-config:
	nvim ~/flake

home-rebuild:
	home-manager switch --flake ~/flake/ -b backup-by-nix

system-rebuild:
	sudo nixos-rebuild switch --flake ~/flake
