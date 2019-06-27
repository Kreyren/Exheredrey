#!/usr/host/bin/env bash

# Create the host keys for the OpenSSH server.
# This is inspired by (and basically a stripped down version of):
# http://pkgs.fedoraproject.org/cgit/openssh.git/tree/sshd-keygen

# Some functions to make the below more readable
KEYGEN=/usr/host/bin/ssh-keygen
RSA_KEY=/etc/ssh/ssh_host_rsa_key
ED25519_KEY=/etc/ssh/ssh_host_ed25519_key

do_rsa_keygen() {
	if [[ ! -s ${RSA_KEY} ]]; then
		echo -n $"Generating SSH2 RSA host key: "
		if test ! -f ${RSA_KEY} && ${KEYGEN} -q -t rsa -f ${RSA_KEY} -C '' -N '' >&/dev/null; then
			echo "Successfully generated ${RSA_KEY}"
		else
			echo "Failed to generate ${RSA_KEY}"
			exit 1
		fi
	fi
}

do_ed25519_keygen() {
	if [[ ! -s ${ED25519_KEY} ]]; then
		echo -n $"Generating SSH2 ED25519 host key: "
		if test ! -f ${ED25519_KEY} && ${KEYGEN} -q -t ed25519 -f ${ED25519_KEY} -C '' -N '' >&/dev/null; then
			echo "Successfully generated ${ED25519_KEY}"
		else
            echo "Failed to generate ${ED25519_KEY}"
			exit 1
		fi
	fi
}

AUTOCREATE_SERVER_KEYS=( RSA ED25519 )

for key in "${AUTOCREATE_SERVER_KEYS[@]}" ; do
	case ${key} in
		RSA) do_rsa_keygen;;
		ED25519) do_ed25519_keygen;;
	esac
done

