retry_service_start() {
  # initialize
  init=$1
  SERV_DIR='/etc/init.d'
  
  # Recommended ref: https://heartbeats.jp/hbblog/2013/06/service-start-stop.html
  #$(which service)
  
  if [ $# -gt 1 ] ; then
    echo "not input [ service ]. "
    exit 1
  elif [ "$(find ${SERV_DIR} -mindepth 1 -maxdepth 1 -name ${init})" = '' ] ; then
    echo "not found service: ${init}"
    exit 1
  fi

  if [ "$(${SERV_DIR}/${init} status | grep 'not')" ] ; then
    ${SERV_DIR}/${init} start
  fi
  echo "[ $(date '+%Y/%m/%d %H:%M:%S') ]: $(${SERV_DIR}/${init} status)"
}

# Usage
retry_service_start "$1"

# Cron
# */1 * * * * (path)/retry_service_start.sh (service)
