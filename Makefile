build:
	git add -A
	git commit -m "Update"
	sudo rsync -r ../nixos/ /etc/
	cd /etc/nixos/ && sudo nixos-rebuild --flake .#jferrara switch --fast
