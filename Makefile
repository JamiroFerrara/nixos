build:
	git add -A
	git commit -m "Update"
	sudo rsync -r ../nixos/ /etc/
	rb
