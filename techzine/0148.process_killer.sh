# echo '0 0 * * * sh process_killer.sh cron' >>/var/spool/cron/${USER}

#!bin/sh
pts=$(tty | cut -d'/' -f3-)
pids=$(ps xho pid,command | grep -v ${pts} | grep ${USER}[@]pts | awk '{print $1}')

results=()
for pid in $pids
do
  results=("${results[@]}Kill PID: ${pid}\n")
  kill -9 ${pid}
done

# case cron
if [ ! "${pids}" = '' -a "$1" = 'cron' ] ; then
  cronlog='cron.log'
  runtime=$(date "+%Y%m%d_%H%M%S")
  echo -e "[ ${runtime}: This PID: ${pts} ]\n${results[@]}" | tee -a ${cronlog}
fi
