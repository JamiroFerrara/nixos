build:
	git add -A
	git commit -m "Update"
	mv .git .git_
	sudo rsync -r ../nixos/ /etc/
	cd /etc/nixos/ && sudo nixos-rebuild --flake .#jferrara switch --fast
	mv .git_ .git
