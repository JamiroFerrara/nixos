build:
	mv .git .git_
	sudo rm -dfr /etc/nixos
	sudo rsync -r ../nixos/ /etc/nixos
	mv .git_ .git
	cd /etc/nixos/ && sudo nixos-rebuild --flake .#jferrara switch --fast
	git add -A
	git commit -m "Update"
