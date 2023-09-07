build:
	git add -A
	git commit -m "Update"
	rsync -r ../nixos/ /etc/
	rb
