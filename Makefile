build:
	git add -A
	git commit -m "Update"
	# mv .git .git_
	sudo rm -dfr /etc/nixos
	sudo rsync -r ../nixos/ /etc/nixos
	# cd /etc/nixos/ && sudo nixos-rebuild --flake .#jferrara switch --fast
	# mv .git_ .git
