if [ -x /usr/bin/xbps-install ]; then
  alias xi='doas xbps-install'
  alias xr='doas xbps-remove'
  alias xlock='doas xbps-pkgdb -m repolock'
  alias xunlock='doas xbps-pkgdb -m repounlock'
  alias xhold='doas xbps-pkgdb -m hold'
  alias xunhold='doas xbps-pkgdb -m unhold'
  alias xq='xbps-query'
fi
