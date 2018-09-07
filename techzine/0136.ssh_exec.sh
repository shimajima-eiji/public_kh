#!/bin/sh

# sudo apt install cron
# sudo apt install zip
# sudo apt install sshpass  # case CentOS: before. sudo yum install epel-release
# need authorized key(all servers)

user='user'
pass='pass'
port=port
server_head='server'
server_foot='_operation'

cmd=$1
output=${2:-/dev/null}

log_cmd=$(echo "${cmd}" | sed 's/ /_/g')
if [ ! "${output}" = '/dev/null' ]; then
  sav_log="$(dirname $0)/$(date "+%Y%m%d_%H%M%S")-${log_cmd}"
  mkdir ${sav_log}
fi

for i in `seq 1 19`
do
  if [ $i -eq 1 -a "$cmd" = "df" ]; then
    continue
  fi
  server=`printf "${server_head}%02d${server_foot}" $i`
  echo ${server}  # for debug, or(and) monitoring
  if [ ! "${output}" = '/dev/null' ]; then
    output="${sav_log}/${server}_${log_cmd}.log"
  fi
  echo "${pass}" | sshpass -p "${pass}" ssh -p ${port} -t -o "StrictHostKeyChecking no" $user@${server} "sudo -S ${cmd}" 2>/dev/null | tee ${output}
done

if [ ! "${output}" = '/dev/null' ]; then
  zip -r ${sav_log}.zip ${sav_log}
  rm -rf ${sav_log}
fi
