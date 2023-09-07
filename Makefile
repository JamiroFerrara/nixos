build:
	sudo rm -dfr /etc/nixos
	sudo rsync -rl ../nixos/ /etc/nixos
	sudo rm -dfr /etc/nixos/.git
	cd /etc/nixos/ && sudo nixos-rebuild --flake .#jferrara switch --fast
	git add -A
	git commit -m "Update"
