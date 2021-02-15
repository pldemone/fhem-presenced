#################################################################################
# presenced                                                                     #
#################################################################################
# presenced
# Copyright (C) 2021 Mirko Lindner, demon (at) pro-linux.de (dot) de
#
# checks for one or multiple bluetooth devices for their
# presence state and reports it to the 73_PRESENCE.pm module.
#
# Based on leprecenced
# Copyright (C) 2015-2018 P. Reinhardt, pr-fhem (at) reinhardtweb (dot) de
#
# This script free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# The GNU General Public License can be found at
# http://www.gnu.org/copyleft/gpl.html.
# A copy is found in the textfile GPL.txt and important notices to the
# license from the author is found in LICENSE.txt distributed with these
# scripts.
#
# This script is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
##############################################################################

PREFIX		= /usr
CONFDIR		= /etc

install:
	# Install executables
	install -m 0755 -o root -g root src/collectord $(PREFIX)/bin
	install -m 0755 -o root -g root src/npresenced $(PREFIX)/bin
	install -m 0755 -o root -g root src/lepresenced $(PREFIX)/bin
	install -m 0755 -o root -g root src/presenced $(PREFIX)/bin

	# Install services
	if [ -d "/usr/lib/systemd/system" ]; then for i in systemd/*; do install -m 0644 -o root -g root $$i /usr/lib/systemd/system ; done ; fi
	if [ -d "/lib/systemd/system" ]; then for i in systemd/*; do install -m 0644 -o root -g root $$i /lib/systemd/system ; done ; fi

	# Install etc
	if [ -d "/usr/lib/systemd/system" ]; then install -d -m 0755 -o root -g root $(CONFDIR)/presenced ; fi
	for i in etc/*; do install -m 0644 -o root -g root $$i $(CONFDIR)/presenced/ ; done ;


uninstall:
	rm $(PREFIX)/bin/collectord
	rm $(PREFIX)/bin/npresenced
	rm $(PREFIX)/bin/lepresenced
	rm $(PREFIX)/bin/presenced

	if [ -d "/usr/lib/systemd/system" ]; then \
		rm /usr/lib/systemd/system/lepresenced.service; \
		rm /usr/lib/systemd/system/presenced.service; \
		rm /usr/lib/systemd/system/npresenced.service; \
	fi

	if [ -d "/lib/systemd/system" ]; then \
		rm /lib/systemd/system/lepresenced.service; \
		rm /lib/systemd/system/presenced.service; \
		rm /lib/systemd/system/npresenced.service; \
	fi


