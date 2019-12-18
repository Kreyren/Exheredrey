#!/bin/bash

DEPENDENCIES="
	build:
		sys-devel/biso
		sys-devel/flex[>=2.6.4] [[ note = [ https://bugs.winehq.org/show_bug.cgi?id=42132 ] ]]
		sys-devel/gettext
		virtual/pkg-config
		x11-proto/xorgproto
	build+run:
	$(if true; then printf '%s\n' \
		"sys-libs/zlib"
	fi)
"

echo $DEPENDENCIES
