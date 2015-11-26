if [ -x "$(command -v /usr/bin/sudo)" ]; then
	alias sudovi="EDITOR=vi sudoedit $@"
	alias sudovim="EDITOR=vim sudoedit $@"
fi
