# echo '0 0 * * * sh process_killer.sh cron' >>/var/spool/cron/${USER}

#!bin/sh
runtime=$(date "+%Y%m%d_%H%M%S")
pts=$(($PPID - 1))  # ptsは自プロセスの1つ前のPIDを持つ
command="sshd: ${USER}@pts/*"

pids="[ ${runtime}: This PID: ${PPID} ]\n"
for i in $(seq 1 6)  #process idが100000の桁までは確認済み
do
  results=$(ps x | grep -v 'grep' | grep -v "$pts" | grep "${command}" | cut -f$i -d' ')
  for result in $results
  do
    if [ "${result}" = '?' ] ; then
      break
    fi
    kill -9 ${result}
    pids="${pids}Kill PID: ${result}\n"
  done
done

echo ${pids} | tee -a cron.log
