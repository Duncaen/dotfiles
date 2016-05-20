if [ -x /usr/bin/xbps-install ]; then
  alias xi='doas -- xbps-install'
  alias xr='doas -- xbps-remove'
  alias xq='xbps-query'
fi
