if [ -d /etc/xbps.d ]; then
  export XBPS_DISTDIR=/srv/void-packages
  alias xi='sudo xbps-install'
  alias xr='sudo xbps-remove'
  alias xq='xbps-query'
fi
