#!/bin/bash

set -eu

install -d $HOME/.local/bin
install -d $HOME/.local/kickstart
install -m 755 vmctl $HOME/.local/bin
install -m 644 fixdhcp.sh $HOME/.local/kickstart

pubkeyfile=$(ls -1 $HOME/.ssh/id*.pub | head -1)
pubkey=$(<$pubkeyfile)
echo "Please enter the password to use in the kickstart files for root and user1:"
password=$(mkpasswd --method=SHA-512)

for i in rhel*.cfg.IN
do
	if ! [ -f "$HOME/.local/kickstart/$(basename ${i} .IN)" ]
	then
		sed -e "s|__SSHPUBKEY__|${pubkey}|g" -e "s|__PASSWORD__|${password}|g"< "${i}" > \
			"$HOME/.local/kickstart/$(basename ${i} .IN)"
		chmod 644 "$HOME/.local/kickstart/$(basename ${i} .IN)"
	else
		echo "Kickstart file already exists, skipping: $(basename ${i})"
	fi
done
