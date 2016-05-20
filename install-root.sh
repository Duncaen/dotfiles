#!/bin/sh

ln -sfv "${PWD}/sv/runsvdir-duncan" /etc/sv
chown -v root:root /usr/local/bin/pam_runit_session

ln -sfv "${PWD}/ssh/ssh_config" /etc/ssh/ssh_config
chown -v root:root /etc/ssh/ssh_config
chmod -v 644 /etc/ssh/ssh_config
