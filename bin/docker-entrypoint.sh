#! /bin/sh

if [ -f /config/settings.sh ]; then
  source /config/settings.sh
fi

case $1 in
  sh | bash ) sh ;;
  * ) minio $@
esac
