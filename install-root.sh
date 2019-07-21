#!/bin/sh

install -d /etc/sv/runsvdir-duncan
install -m755 sv/runsvdir-duncan/run /etc/sv/runsvdir-duncan/run
install -m755 sv/runsvdir-duncan/finish /etc/sv/runsvdir-duncan/finish
ln -sf /run/runit/supervise.runsvdir-duncan /etc/sv/runsvdir-duncan/supervise
