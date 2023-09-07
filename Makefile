build:
	git add -A
	git commit -m "Update"
	rsync ../nixos/ /etc/
	rb
