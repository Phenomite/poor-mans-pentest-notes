#!/bin/bash
[ -z $1 ] && exit 1
# Use linux-default-installs repo to set up the symlink used below (seclists)
for user in $(cat /opt/wordlist-users-names.txt);
	do rpcclient -U "" $@ -N --command="lookupnames $user" \
	| grep -i "user:" \
	|| echo "User ${user} not found or access denied.";
done
